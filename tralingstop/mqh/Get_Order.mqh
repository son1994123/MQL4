//+------------------------------------------------------------------+
//|                                                    Get_Order.mqh |
//|                                           Son Nguyen Development |
//|                                         https://webdanang43.net/ |
//+------------------------------------------------------------------+
#property copyright "Son Nguyen Development"
#property link      "https://webdanang43.net/"
#property strict
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
int Get_Ticket (int _Number) {
   int _Ticket_OK = NULL;
   if(OrderSelect(_Number,SELECT_BY_POS,MODE_TRADES))
     {
      _Ticket_OK = OrderTicket();
     }
   return _Ticket_OK;
}

double Get_Open_Oder_Price (int _Ticket) {
   double _Price = NULL; 
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _Price = OrderOpenPrice();
     }
   return _Price;
}

double Get_Order_Lots (int _Ticket) {
   double _Lots = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _Lots = OrderLots();
     }
   return _Lots;
}

double Get_Profit (int _Ticket) {
  double _Profit = NULL;
  if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
    {
     _Profit = OrderProfit();
    }
   return _Profit;
}

int Get_Magic_Number(int _Ticket) {
   int _Magic_Number = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _Magic_Number = OrderMagicNumber();
     }
   return _Magic_Number;
}

double Get_Stop_Loss (int _Ticket) {
   double Stop_Loss = NULL;
    if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
      {
       Stop_Loss = OrderStopLoss();
      }
   return Stop_Loss;
}