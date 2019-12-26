//+------------------------------------------------------------------+
//|                                                   singal_x71.mqh |
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
int Max_50;

int Get_Max_50 (int Loop_in_how_much) {
  int _Max_50 = iHighest(Symbol(),PERIOD_CURRENT,MODE_HIGH,Loop_in_how_much,0);
   return _Max_50;
}
int Get_Min (int Loop_in_how_much) {
  int _Min = iLowest(Symbol(),PERIOD_CURRENT,MODE_LOW,Loop_in_how_much,0);
  return _Min;
}

int Get_Max (int Loop_in_how_much) {
  int _Max = iHighest(Symbol(),PERIOD_CURRENT,MODE_LOW,Loop_in_how_much,0);
  return _Max;
}
