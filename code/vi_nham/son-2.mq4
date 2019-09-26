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

void OnTick()
  {
//---
  // int Count = 1;
   int until = Count_Magic_Number_145()- 1;
   double Gap_Pip[100];
   if(Count_Magic_Number_145() == 0)
     {
      BUY(0.01,145,"vAO LENH ");      // COunt = 1
     }

   

   // int Count_1 = ;
    for(int i=0;i<10;i++)
      {
       string _comment = "Vao Lenh" + (i+1);
       Gap_Pip[i] = Bid - Get_Order_Open_Price(Count_Magic_Number_145() - 1);
         if(Gap_Pip[i] >= 0.0030)
           {
            if(Count_Magic_Number_145() == (i+1))
              {
               BUY(0.03,145,_comment);
              }
           }
      }   
  // Gap_Pip[2] = Bid - Get_Order_Open_Price(2);
   
   //Comment(Get_Order_Open_Price(until));
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