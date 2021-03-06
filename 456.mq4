//+------------------------------------------------------------------+
//|                                                          abs.mq4 |
//|                                   Copyright 2019, Son Nguyen Dev |
//|                                             https://g-saram.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, Son Nguyen Dev"
#property link      "https://g-saram.com/"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int Ticket_Global[1000];
double Lots_Global[1000];
double Order_Open_Price_Global[1200];
double Profit_Global[1000];
int Type_Global[1000];
int BUY(double _lots, int _magic, string _comment, double _takeProfit) {
   int Ticket;
   Ticket = OrderSend(Symbol(),OP_BUY,_lots,Ask,0,NULL,_takeProfit,_comment,_magic,NULL,Green);
   return Ticket;
   }
double Get_Value_Number (double _number) {
   double Number_OK;
   Number_OK = DoubleToString(_number,5);
   return Number_OK;
}
int SELL(double _lots, int _magic, string _comment,double _takeProfit) {
   int Ticket;
   Ticket = OrderSend(Symbol(),OP_SELL,_lots,Bid,0,NULL,_takeProfit,_comment,_magic,NULL,Green);
   return Ticket;
   }
int OnInit()
  {
//---
   
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
   int Type;
   int total = (OrdersTotal() + 1);
   int Ticket[100];
   double Lots[100];
   int Ticket_Special[100];
   double Order_Open_Price_Special[100];
   double Order_Lots[100];
   double profit = 0.000;
   Assign_Ticket_Lots();
   
 //   Comment(Ticket_Global[1] +"\n"+ Lots_Global[1]);
    
             
    if(Count_Magic_144() == 0)
           {
            Ticket_Special[0] = BUY(0.01,144,"Lenh dau tien",NULL);
           }
   if(OrderSelect(Ticket_Special[0],SELECT_BY_TICKET,MODE_TRADES))
     {
      Order_Open_Price_Special[0] = OrderOpenPrice();
      Order_Lots[0] = OrderLots();
     }         
  double Price_For_Buy = Order_Open_Price_Special[0] + 0.0030;
  double Price_For_Sell = Order_Open_Price_Special[0] - 0.0030;
  double Price_For_Buy_Close = Order_Open_Price_Special[0] + 0.0060;
  double Price_For_Sell_Close = Order_Open_Price_Special[0] - 0.0060;
  double bid = Bid;
     
 //Comment(Price_For_Buy +"\n"+ Price_For_Sell);           
   for(int i=0;i<total;i++)
     {
     double Loop_Volume = 3*Lots_Global[i]; // gap doi lenh truoc
     string Loop_Comment = "Lenh danh thu" + i; // Comment thoi
     int Check;
      if(Bid <= Get_Value_Number(Price_For_Sell) && Type_Global[i] == 0)
        {
         if(Count_Magic_144() == 1 && Count_Magic_145() == i)
           {
            SELL(Loop_Volume,145,Loop_Comment,NULL);
        //    Comment(Get_Value_Number(Price_For_Sell_Close));
           }
         
              //double So_moi = Order_Open_Price_Global[0] 
          
         }
          if(Bid <= Get_Value_Number(Order_Open_Price_Special[0] - 0.0060 ) && Type_Global[i] == 1)
             {
              if(Count_Magic_145() > 0 )
                {
                    for(int c=0;c<OrdersTotal();c++)
                      {
                      Active_Order_Close_Pro(c);
                      }
                }
             } 
        
      if(Bid >= Get_Value_Number(Price_For_Buy) && Type_Global[i] == 1)
        {
         if(Count_Magic_144() == 1 && Count_Magic_145() == i)
           {
            BUY(Loop_Volume,145,Loop_Comment,NULL);
           }
         // return; 
        } 
       if(Bid >= Get_Value_Number(Order_Open_Price_Special[0] + 0.0060 ))
             {
              if(Count_Magic_145() > 0)
                {
                 for(int c=0;c<OrdersTotal();c++)
                   {
                   Active_Order_Close_Pro(c);
                   }
                }
             }         
     }  
      
     
 
        
           
     
  
   //Comment(Ticket_Global[0] +"\n" + Ticket_Global[1] +"\n" + Ticket_Global[2] +"\n" + Ticket_Global[3] +"\n" + Ticket_Global[4]+"\n" + Ticket_Global[5]+"\n" + Ticket_Global[6]+"\n" + Ticket_Global[7]);      
    
 
 
}
//---

//-- Gán Ticket và Lóts
void Assign_Ticket_Lots () {
   for(int i=0;i<=OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         Ticket_Global[i] = OrderTicket();
         Lots_Global[i] = OrderLots();
         Order_Open_Price_Global[i] = OrderOpenPrice();
         Type_Global[i] = OrderType();
         Profit_Global[i] =  OrderProfit();
         
        }
     }
}
      
//---
int amount_candle(int _number) {
   int _period = Period();
   int _amount_candle = _number * _period * 60 * 1000;
   return _amount_candle;
}
//---


//---

double Get_Lots_Until () {
   double _Lots;
   double _Result;
   if(OrderSelect(Count_Magic_145(),SELECT_BY_POS,MODE_TRADES))
     {
      _Lots = OrderLots();
     }
     return _Lots;
}
//---

int Count_Magic_144 () {
   int Count; 
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 144)
           {
            Count++;
           }
        }
     }
     return Count;
}
int  Count_Magic_145 () {
   int Count;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 145)
           {
            Count++;
           }
        }
     }
     return Count;
}
 
  
  
int Check_BUY_OR_SELL (int _number) { // kiểm tra xem lệnh nào đó là buy hay sell
   int _Result; 
   int _Ticket;
   int _Type;
   
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      _Ticket = OrderTicket();
      _Type = OrderType();   
     }
   switch(_Type)
     {
      case 0:
         _Result = 0;
        break;
      case 1:
         _Result = 1;
         break;
      default:
         _Result = NULL;
        break;
     }
    return _Result; 
} 
//---
double Get_Order_Open_Price (int _number)  {
   double _OrderOpenPrice;
   int _Ticket;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
   //   _OrderOpenPrice = OrderOpenPrice();
        _Ticket = OrderTicket();
     }
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
        _OrderOpenPrice = OrderOpenPrice(); 
     }
  return _OrderOpenPrice;
}
//---
bool Active_Order_Close (int _number) {
   int _ticket;
   double _lots;
  if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
    {
     _ticket = OrderTicket();
     _lots = OrderLots();
    }
   OrderClose(_ticket,_lots,Close[0],0,Red);
  return 0;
} 
bool Active_Order_Close_Pro (int _number ) {
   int _ticket;
   double _lots;
   int _type;
   double _price;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      _ticket = OrderTicket();
      _lots = OrderLots();
      _type = OrderType();
     }
   switch(_type)
     {
      case  0:
        _price = Bid;
        break;
      case 1:
         _price = Ask;
         break;  
      default:
        break;
     }  
    OrderClose(_ticket,_lots,_price,0,Red); 
    return 1;
}  

//+------------------------------------------------------------------+