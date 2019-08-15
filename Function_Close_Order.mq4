//+------------------------------------------------------------------+
//|                                         Function_Close_Order.mq4 |
//|                                              Son Nguyen, G-saram |
//|                                         https://www.g-sarram.com |
//+------------------------------------------------------------------+
#property copyright "Son Nguyen, G-saram"
#property link      "https://www.g-sarram.com"
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
   if(Bid >= 0)
     {
      Order_Close(0);
     }
  }
  
bool Order_Close (int _number) {
   int Ticket;
   double Lots;
   int Type;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      Ticket = OrderTicket();
      Lots = OrderLots();
      Type = OrderType();
     }
   double Price;
    switch(Type)
      {
       case  0:
         Price = Bid;
         break;
       case 1:
         Price = Ask;
          break;
       default:
         Price = NULL;
         break;
      }
    OrderClose(Ticket,Lots,Price,0,White);
    return 0;
} 
//+------------------------------------------------------------------+
