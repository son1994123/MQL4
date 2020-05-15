//+------------------------------------------------------------------+
//|                                                  orderselect.mqh |
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
int Order_Ticket_Number (int _number) {
   int _result = NULL;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      _result = OrderTicket();
     }
    return _result;
}
double Order_Close_Price (int _Ticket) {
  double _result = NULL;
  if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
    {
      _result = OrderClosePrice();
    }
    return _result;
}

datetime   Order_Close_Time (int _Ticket) {
   datetime _result =NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderCloseTime();
     }
    return _result;
}

string Order_Comment (int _Ticket) {
   
   string _result = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderComment();
     }
   return _result;
}

double Order_Commission (int _Ticket) {
   double _result = NULL;
   if(OrderSelect(_Ticket, SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderCommission();
     }
     
   return _result;
}

double Order_Lots (int _Ticket) {
   double _result = NULL;
   
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderLots();
     }
    return _result;
}

int Order_MagicNumber (int _Ticket) {
   int _result = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderMagicNumber();
     }
     
   return _result;
}


double Order_Open_Price (int _Ticket) {
   double _result = NULL;
   
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderOpenPrice();
     }
   return _result;
}

datetime Order_Open_Time (int _Ticket) {
   datetime _result = NULL;
   
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderOpenTime();
     }
   return _result;
}

double Order_Profit (int _Ticket) {
   double _result = NULL;
   
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderProfit();
     }
   return _result;
}

double Order_StopLoss (int _Ticket ) {
   double _result = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderStopLoss();
     }
    return _result;
}

double Order_TakeProfit (int _Ticket ) {
   double _result = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderTakeProfit();
     }
    return _result;
}

string Order_Symbol (int _Ticket ) {
   string _result = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderSymbol();
     }
    return _result;
}

int Order_Type (int _Ticket ) {
   int _result = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _result = OrderType();
     }
    return _result;
}