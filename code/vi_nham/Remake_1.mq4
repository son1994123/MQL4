//+------------------------------------------------------------------+
//|                                                     Remake_1.mq4 |
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
int BUY(double _lots, int _magic, string _comment) {
   int Ticket;
   Ticket = OrderSend(Symbol(),OP_BUY,_lots,Ask,0,NULL,NULL,_comment,_magic,NULL,Green);
   return Ticket;
}
int SELL(double _lots, int _magic, string _commnet) {
   int Ticket;
   Ticket = OrderSend(Symbol(),OP_SELL,_lots,Bid,0,NULL,NULL,_commnet,_magic,NULL,Red);
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
   int Buy_Combo[100];
   double Lots_Of_Orders[100];
   int Ticket_Of_Orders[100];
   int Magic_Of_Orders[100];
   double Price_Open_Of_Orders[100];
   double Profit_Of_Orders[100];
   
   if(Count_Magic_Number_144() == 0)
     {
      BUY(0.01,144,"BUY_1");
     } 
   
      
  }
  
int Count_Magic_Number_144 () {
   int Count;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderMagicNumber() == 144)
        {
         Count++;
        }
     }
     return Count;
}
  
//+------------------------------------------------------------------+
