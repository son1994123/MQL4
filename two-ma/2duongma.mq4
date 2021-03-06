//+------------------------------------------------------------------+
//|                                                        Two-MA.mq4|
//|                                  Copyright 2020, Son Nguyen Dev  |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright IT Team G-Saram Company"
#property link      "https://g-saram.com"
#property version   "1.00"
#property strict

input int FastMAPeriod = 105;// duong MA nhanh
input int SlowMAPeriod = 365;// duong MA CHam
input double Lots = 0.1;// So lot danh
input int TP_lenh = 10; // So pip can tp

input int SL_Lenh = 10; // So PIp cua SL

enum indicatorEnum 
  {
   EMA = MODE_EMA,
   SMA = MODE_SMA,
   SSMA = MODE_SMMA,
   LWMA = MODE_LWMA
  };
input indicatorEnum  duongMA = MODE_SMA;
enum Option_SL
  {
   KhongDeSL = FALSE,
   CoDeSL = TRUE
  };
  
input Option_SL LuachonSL = TRUE;

int Ticket = 0; //Ticket Number

//+------------------------------------------------------------------+
//| Expert initialization functiosn                                   |
//+------------------------------------------------------------------+
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
         double TP_lenh_ok = NULL; // Chuyen qua Point
         double SL_Lenh_ok = NULL;
//---
if(LuachonSL == TRUE)
  {
      
  // TP_lenh_ok = (TP_lenh * 10) * Point ; // Chuyen qua Point
   SL_Lenh_ok = (SL_Lenh * 10) * Point;     
    } 
if(LuachonSL == FALSE)
  {
  // TP_lenh_ok = NULL;
   SL_Lenh_ok = NULL; 
  }




   // LOGIC DIEU KIEN MA DE VAO LENH
   
   int MA = duongMA;
   double Fast_MA1 = iMA(_Symbol, 0, FastMAPeriod, 0, MA , PRICE_CLOSE, 1); //(Fast) Moving Average (Duong MA cham)
   double Slow_MA1 = iMA(_Symbol, 0, SlowMAPeriod, 0, MA , PRICE_CLOSE, 1); //(Slow) Moving Average (Duong MA nhanh)
   
   //
   double Fast_MA2 = iMA(_Symbol, 0, FastMAPeriod, 0, MA , PRICE_CLOSE, 2); //Two bars before the current bar
   double Slow_MA2 = iMA(_Symbol, 0, SlowMAPeriod, 0, MA , PRICE_CLOSE, 2);
   
   
   double FastMA1 = NormalizeDouble(Fast_MA1,5);
   double SlowMA1 = NormalizeDouble(Slow_MA1,5);
   double FastMA2 = NormalizeDouble(Fast_MA2,5);
   double SlowMA2 = NormalizeDouble(Fast_MA2,5);
   int truonghop = 0; // KHAI BAO BIEN TRUONGHOP = 0 LA MAC DINH HOAC LA NULL
   //
 
   
   if(OrderSelect(Ticket, SELECT_BY_TICKET) && OrderCloseTime() == 0)
   {
    
      if(OrderType() == OP_BUY)
      {
      truonghop = 1; //Buy Position 
      }
       
      if(OrderType() == OP_SELL) {
         truonghop = -1;
      } //Sell Position
   }
  
   // MUC DICH CUA HAM NAY LA 
   bool ret; //
   
   if(Fast_MA2 <= Slow_MA2 && Fast_MA1 > Slow_MA1) // Tín hiệu BUY
   {
      if(truonghop < 0)
      {
         ret = OrderClose(Ticket, OrderLots(), OrderClosePrice(), 0);
         if(ret){
             truonghop = 0; 
         }// 
      }
      
      //
      if(truonghop == 0) {
        // Ticket = OrderSend(_Symbol, OP_BUY, Lots, Ask, 0, 0, 0); // Lenh BUY
         Ticket = OrderSend(_Symbol ,OP_BUY,Lots,Ask,2, (Ask - SL_Lenh_ok),NULL ,"Lenh BUY",0,NULL,Green);
      }
   }
   
   if(Fast_MA2 >=  Slow_MA2 && Fast_MA1 < Slow_MA1) //Sell signal
   {
      //
      if(truonghop > 0)
      {
         ret = OrderClose(Ticket, OrderLots(), OrderClosePrice(), 0);
         if(ret) {
            truonghop = 0;
         } //
      }
      //
      if(truonghop == 0) {
         Ticket = OrderSend(_Symbol, OP_SELL, Lots, Bid,2,(Ask + SL_Lenh_ok),NULL,"Lenh SELL",0,NULL,Red);
         }
      }
  
  }
//+------------------------------------------------------------------+

int Get_Order_Ticket ( int _Number) {
   int TicketOrder = NULL;  
   
  if(OrderSelect(_Number, SELECT_BY_POS, MODE_TRADES))
    {
     TicketOrder = OrderTicket();
    }
   return TicketOrder;
}
