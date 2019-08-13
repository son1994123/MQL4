//+------------------------------------------------------------------+
//|                                                  Recovery_EA.mq4 |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, MetaQuotes Software Corp"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#define  BUY  1
#define  SELL 2

input string inLots         = "0.1,0.28,0.49,0.85,1.47,2.54,5.08,10.2,14.8,20"; // LotSize
input int    TakeProfit     = 50; 
input int    Risk_zone      = 20;     // Risk zone
input int    Magic_Number   = 201603; // Magic Number
input string TradesComment  = "Recovery_EA";

input string s1  ="____________________________";//______________Indicator Settingis
input int						MA_Period    = 50; 			   
input ENUM_MA_METHOD			MA_Method    = MODE_SMA;		
input ENUM_APPLIED_PRICE	MA_Price     = PRICE_CLOSE;	

int pipfactor = 1;
double Lotsize[];
datetime last_close_time = TimeCurrent();
bool gd_close_all;
int MaxTrades;
bool stop_pending;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
  pipfactor = Pipfactor();  
  StringToArray(inLots,Lotsize);
  MaxTrades = ArraySize(Lotsize);
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

   if( Hit_TP(last_close_time) ) gd_close_all = true;
   
   if(gd_close_all) {
     bool check = CloseAllOrder(-1,Magic_Number); 
   }

   int entry_signal = Fx_sinal();
  
   int cnt_open =0, cnt_pending =0;
   double last_price =0, center_price =0, buy_tp =0, sell_tp =0;  
   int last_type=-1;
      
   for(int cnt=0; cnt<OrdersTotal(); cnt++) {
      int select = OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES);
      if(OrderSymbol()!= Symbol())continue;
      if(OrderMagicNumber() != Magic_Number)continue;
      if(OrderType()< 2) {
         if(center_price==0) center_price = OrderOpenPrice();
         last_type = OrderType();
         last_price = OrderOpenPrice();
         cnt_open++;
      }
      if(OrderType()==OP_BUYSTOP || OrderType()==OP_SELLSTOP ) cnt_pending++;   
   }
      
   if(gd_close_all) {
      if(cnt_open+cnt_pending<1) gd_close_all = false;
      return;
   }

   // open first trade
   if(cnt_open+cnt_pending<1) {
      stop_pending = false;
      if(entry_signal==BUY) {
      int ticket = MarketOrder(Symbol(),OP_BUY,Lotsize[0],0,TakeProfit*pipfactor,TradesComment,Magic_Number);
      }   
      else
      if(entry_signal==SELL) {
      int ticket = MarketOrder(Symbol(),OP_SELL,Lotsize[0],0,TakeProfit*pipfactor,TradesComment,Magic_Number);
      }   
   }
   
   
   // open recover trade
   
   if(GetLastError()==134) stop_pending = true;

   if(cnt_open>0 && cnt_pending<1 && cnt_open<MaxTrades && !stop_pending) {
      int divider = 1;
      if(cnt_open==1) divider = 2;
      if(last_type==OP_BUY) {
      double pend_price = NormalizeDouble(last_price - (Risk_zone*pipfactor/divider)*Point,Digits);
      double tp_price = 0;
      if(TakeProfit>0) tp_price = center_price - TakeProfit*pipfactor*Point;
      int ticket = PendingOrder(Symbol(),OP_SELLSTOP,Lotsize[cnt_open],pend_price,0,tp_price,TradesComment,Magic_Number);
      }
      else
      if(last_type==OP_SELL) {
      double pend_price = NormalizeDouble(last_price + (Risk_zone*pipfactor/divider)*Point,Digits);
      double tp_price = 0;
      if(TakeProfit>0) tp_price = center_price + TakeProfit*pipfactor*Point;
      int ticket = PendingOrder(Symbol(),OP_BUYSTOP,Lotsize[cnt_open],pend_price,0,tp_price,TradesComment,Magic_Number);
      }
   }

   
  }
//+------------------------------------------------------------------+

int MarketOrder(string symbol, int type, double lotsize, double stoploss, double takeprofit,string comment, int magic, bool broker_ecn = true) {
   if(!IsTradeAllowed()) return(0);
   if(lotsize*MarketInfo(symbol,MODE_MARGINREQUIRED)> AccountFreeMargin()) return(0);
   int error; int ticket; int slippage = (int) MarketInfo(symbol,MODE_SPREAD);
   double point = MarketInfo(symbol,MODE_POINT);
   double stoplevel = MarketInfo(symbol,MODE_STOPLEVEL); 
   double price = MarketInfo(symbol,MODE_ASK);
   color cl = clrGreen;
   double sl = 0, tp  = 0;
   if( stoploss > 0 ) sl  = MathMin(price - stoploss*point,price - stoplevel*point);
   if( takeprofit > 0 ) tp  = MathMax(price + takeprofit*point,price + stoplevel*point);
   if (type == OP_SELL) { 
   cl = clrRed; 
   price = MarketInfo(symbol,MODE_BID); 
   if( stoploss > 0 ) sl = MathMax(price+stoploss*point,price + stoplevel*point);
   if( takeprofit > 0 ) tp  = MathMin(price - takeprofit*point,price - stoplevel*point);
   }   
   if (broker_ecn) {
   ticket = OrderSend(symbol, type, lotsize, price, slippage, 0, 0, comment, magic, 0, cl);
   if (ticket > 0 && (sl != 0 || tp !=0 )) int gi_modify = OrderModify(ticket, OrderOpenPrice(), sl, tp , 0,cl);
   } else {
   ticket = OrderSend(symbol, type, lotsize, price, slippage, sl, tp, comment, magic, 0, cl);
   }
   if (ticket <= 0) {
      error = GetLastError();
      Print("Error " + (string) error +" when sending market order.");
      return (0);
   }
   return (ticket);
}

int PendingOrder( string symbol, int type, double lots, double price, double stoploss, double takeprofit,string comment, int magic ) {
  if(!IsTradeAllowed()) return(0);
  if(lots*MarketInfo(symbol,MODE_MARGINREQUIRED)> AccountFreeMargin()) return(0);
  double ask = MarketInfo(symbol,MODE_ASK);
  double bid = MarketInfo(symbol,MODE_BID);
  double point = MarketInfo(symbol,MODE_POINT);
  int stoplevel = (int)MarketInfo(symbol,MODE_STOPLEVEL);
  datetime expirationTime = 0;
  color cl = clrBlue;
  if(type==OP_BUYSTOP||type==OP_BUYLIMIT) {
     if(type==OP_BUYSTOP) price = MathMax(price,ask+stoplevel*point);
     if(type==OP_BUYLIMIT) price = MathMin(price,ask-stoplevel*point);
  }
  if(type==OP_SELLSTOP ) {
     if(type==OP_SELLSTOP) price = MathMin(price,bid-stoplevel*point);
     if(type==OP_SELLLIMIT) price = MathMax(price,bid+stoplevel*point);
     cl = clrRed;
  }  
  int ticket;
  ticket=OrderSend(symbol,type,lots,price,0,stoploss,takeprofit,comment,magic,expirationTime,cl);
  if(ticket==-1) Print("Error " + (string) GetLastError() +" when sending pending order.");
  return (ticket);
}


int Fx_sinal() {
  int sig =0; 
  double gd_ma_10 = iMA(NULL,0, MA_Period, 0, MA_Method, MA_Price,1);
  if(Close[0] > gd_ma_10 ) sig = BUY;
  else if(Close[0] < gd_ma_10 ) sig = SELL;
  return(sig);
}

void StringToArray(string source,double& array[], string separator = ",")
{
  string result[];
  int k=StringSplit(source,StringGetCharacter(separator,0),result);  
  ArrayResize(array,k);
  int cnt = 0;
  for( int i=0; i< k; i++) {
     StringTrimLeft(StringTrimRight(result[i])); 
     if(StringLen(result[i])>0) {
     array[cnt] = StringToDouble(result[i]);
     cnt++;
     }
  }
  ArrayResize(array,cnt);
}

int CloseAllOrder(int a_type, int a_magic)  {
  int result=0;
  bool repeat = true;
  while(repeat && !IsStopped() )  {
     repeat=false; 
     int totalorders = OrdersTotal();
     for(int i=totalorders-1;i>=0;i--) {
       int select =  OrderSelect(i, SELECT_BY_POS);
       if(OrderSymbol()==Symbol() && OrderMagicNumber()==a_magic && (OrderType() == a_type || a_type ==-1 ) ) {
       repeat=true; 
       if(OrderType()<2) result = OrderClose( OrderTicket(), OrderLots(), OrderClosePrice(), 100);
       else result = OrderDelete(OrderTicket(),clrNONE);
       }
     }
  }
  return(result);
}

bool Hit_TP(datetime& a_close_time) {
   for(int cnt=OrdersHistoryTotal()-1;cnt>=0;cnt--)  {
   int select =  OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY);
   if(OrderCloseTime() <=a_close_time) continue;
   if(OrderSymbol()!=Symbol()) continue;
   if (OrderMagicNumber()== Magic_Number  ) {
   if(StringFind(OrderComment(),"tp",0)>=0 ) {
   a_close_time = OrderCloseTime();
   return(true);
   }
   }
   }
   return(false);          
}

int Pipfactor(string symbol="") {
  int factor =1;
  if(symbol=="") symbol = Symbol();
  double digit = MarketInfo(symbol,MODE_DIGITS); 
  if (digit == 3 || digit == 5)  factor = 10;  
  if(MarketInfo(symbol,MODE_PROFITCALCMODE)==1) factor = 10; 
  return(factor);
}
