//+------------------------------------------------------------------+
//|                                                    playsound.mq4 |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
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
   int Total_Profit = 0;
   int Ticket[1000];
   int Profit[1000];
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         Ticket[i] = OrderTicket();
         Profit[i] = OrderProfit();
        }
     }
   for(int i=0;i<OrdersTotal();i++)
     {
      Total_Profit = Total_Profit + Profit[i];
     }
   if(Total_Profit > 1.0)
     {
      PlaySound("votay.wav");
      //SendMail("Chu de", "Vao lenh kia may");
      for(int i=0;i<OrdersTotal();i++)
        {
         OrderClose(Ticket[i],OrderLots(),OrderClosePrice(),0,Red);
        }
     }
  }
//+------------------------------------------------------------------+
