//+------------------------------------------------------------------+
//|                                                    ordersend.mqh |
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
int Order_Sell (double _lots, int _MagicNumber, double _Stoploss, double _TakeProfit, string _Comment) {
 int _result = NULL;
 
 _result = OrderSend(Symbol(),OP_SELL,_lots,Bid,3,_Stoploss,_TakeProfit,_Comment,_MagicNumber,NULL,clrCoral); 
 return _result;

}

int Order_Buy (double _lots, int _MagicNumber, double _Stoploss, double _TakeProfit, string _Comment) {
   int _result = NULL;
   
   _result = OrderSend(Symbol(),OP_BUY,_lots,Ask,3,_Stoploss,_TakeProfit,_Comment,_MagicNumber,NULL,clrChartreuse);
   return _result;
}
