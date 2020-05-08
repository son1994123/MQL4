//+------------------------------------------------------------------+
//|                                                         demo.mqh |
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
int NumberTicketSymbol () {
   int _result = NULL;
   int _loop = 0;
     string _array_current[]= {"EURUSD", "GBPUSD",  "USDJPY",  "AUDUSD ", "ERUGBP", "EURCHF" , "EURJPY ", "GBPCHF", 
   "CADJPY ", "AUDCAD ", "AUDCHF ", "AUDJPY ", "EURNZD ", "USDCHF" , "EURCAD ", "CADCHF ", "NZDCHF ", "NZDJPY" ,"NZDUSD" };
   
   int _TicketNumber[] = {NULL}; 
   
   while( Symbol() != _array_current[_loop] )
     {
      _result = (144 + _loop + 1);     
      Comment(_result);
      _loop++;
     }
  return _result;
}