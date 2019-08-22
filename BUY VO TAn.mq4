//+------------------------------------------------------------------+
//|                                                        Son-1.mq4 |
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
int BUY(double _lots, int _magic, string _comment) {
   int Ticket;
   Ticket = OrderSend(Symbol(),OP_BUY,_lots,Ask,0,NULL,NULL,_comment,_magic,NULL,Green);
   return Ticket;
   }
double Get_Value_Number (double _number) {
   double Number_OK;
   Number_OK = DoubleToString(_number,5);
   return Number_OK;
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
   int total = OrdersTotal();
   if(Count_Magic_Number_144() == 0)
     {
      BUY(0.01,144,"vAO LENH ");      // COunt = 1
     }
                
   for(int i=0;i<OrdersTotal() + 1;i++)
     {
      if(Get_Value_Number(Bid - Get_Order_Open_Price(i)) == 0.0010)
        {
         string for_comment = "Vao lenh BUy thu"+ (i+1);
         if(Count_Magic_Number_145() == i && Count_Magic_Number_144() == 1)
           {
            BUY(0.03,145,for_comment);
           }
        }
     }                 
  }
//+------------------------------------------------------------------+
int Count_Magic_Number_145 () {
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
int Count_Magic_Number_144 () {
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