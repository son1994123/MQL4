//+------------------------------------------------------------------+
//|                                                        dmo_1.mq4 |
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
int BUY(double _lots, int _magic_number, string _comment, double _take_profit) {
   int Ticket = OrderSend(Symbol(),OP_BUY,_lots,Close[0],0,NULL,_take_profit,_comment,_magic_number,NULL,Green);
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
   double Open_Order_Price;
  //if(Count_Magic_Number_144() == 0)
   // {
  //   BUY(0.01,144,"Demo",NULL);
   // } 
  if(OrderSelect(0,SELECT_BY_POS,MODE_TRADES))
    {
     Open_Order_Price = OrderOpenPrice();
    }  
  //Comment(Open_Order_Price);
  int Count_144 = 1;
  if(Count_Magic_Number_144() == Count_144)
    {
     BUY(0.01,144,"aaa",NULL);
     Count_144++;
    }
    Comment(Count_Magic_Number_144()+"\n"+Count_144);
  }
  
  
  int Count_Magic_Number_144 () {
   int count;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 144)
           {
            count++;
           }
        }
     }
     return count;
}
//+------------------------------------------------------------------+
