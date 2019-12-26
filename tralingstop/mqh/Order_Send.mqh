//+------------------------------------------------------------------+
//|                                                   Order_Send.mqh |
//|                                           Son Nguyen Development |
//|                                         https://webdanang43.net/ |
//+------------------------------------------------------------------+
#property copyright "Son Nguyen Development"
#property link      "https://webdanang43.net/"
#property strict

#include <time_now.mqh>
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+
int BUY (double _lot ,int _magic_number, string _comment ) {
   int _ticket = 0;
   _ticket = OrderSend(Symbol(),OP_BUY,_lot,Ask,3,NULL,NULL,_comment,_magic_number,Time_now(),Green);
   return _ticket;
}

int SELL (double _lot, int _magic_number, string _commnet) {
   int _ticket = 0;
   _ticket = OrderSend(Symbol(),OP_SELL,_lot,Bid,3,NULL,NULL,_commnet,_magic_number,Time_now(),White);
   return _ticket;
}

bool Close_All_Order (int _number_of_Close) {
   int Ticket = NULL; 
   double Lot = NULL;
   int Type;
   bool Result;
   double Price_Close;
   
   if(OrderSelect(_number_of_Close,SELECT_BY_POS,MODE_TRADES))
     {
       Ticket = OrderTicket();
       Lot = OrderLots();
       Type = OrderType();
     }
    switch(Type)
      {
       case 0: // 0 = BUY
         Price_Close = Bid;
         break;
       case 1: // 1 = SELL
         Price_Close = Ask;  
          break;  
       default:
         Price_Close = NULL;
         break;
      }
   Result = OrderClose(Ticket,Lot,Price_Close,3,Yellow);
  return Result;
   
}