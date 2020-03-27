//+------------------------------------------------------------------+
//|                                              two-MA.mq4 |
//|                                Development By Nguyen Cong Son    |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Development By Nguyen Cong Son"
#property link      ""
#property version   "1.00"
#property strict

input int FastMAPeriod = 10;//
input int SlowMAPeriod = 40;//
input double Lots = 0.1;//

int Ticket = 0; //Ticket Number

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
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
//---
   // LOGIC DIEU KIEN MA DE VAO LENH
   double FastMA1 = iMA(_Symbol, 0, FastMAPeriod, 0, MODE_SMA, PRICE_CLOSE, 1); //(Fast) Moving Average (Duong MA cham)
   double SlowMA1 = iMA(_Symbol, 0, SlowMAPeriod, 0, MODE_SMA, PRICE_CLOSE, 1); //(Slow) Moving Average (Duong MA nhanh)
   
   //
   double FastMA2 = iMA(_Symbol, 0, FastMAPeriod, 0, MODE_SMA, PRICE_CLOSE, 2); //Two bars before the current bar
   double SlowMA2 = iMA(_Symbol, 0, SlowMAPeriod, 0, MODE_SMA, PRICE_CLOSE, 2);
   
   int pos = 0; //
   //
   if(OrderSelect(Ticket, SELECT_BY_TICKET) && OrderCloseTime() == 0)
   {
      if(OrderType() == OP_BUY) pos = 1; //Buy Position
      if(OrderType() == OP_SELL) pos = -1; //Sell Position
   }
   
   bool ret; //
   
   if(FastMA2 <= SlowMA2 && FastMA1 > SlowMA1) //buy signal
   {
      if(pos < 0)
      {
         ret = OrderClose(Ticket, OrderLots(), OrderClosePrice(), 0);
         if(ret) pos = 0; //
      }
      
      //
      if(pos == 0) Ticket = OrderSend(_Symbol, OP_BUY, Lots, Ask, 0, 0, 0);
   }
   
   if(FastMA2 >=  SlowMA2 && FastMA1 < SlowMA1) //Sell signal
   {
      //
      if(pos > 0)
      {
         ret = OrderClose(Ticket, OrderLots(), OrderClosePrice(), 0);
         if(ret) pos = 0; //
      }
      //
      if(pos == 0) Ticket = OrderSend(_Symbol, OP_SELL, Lots, Bid, 0, 0, 0);
   }
   
  }
//+------------------------------------------------------------------+
