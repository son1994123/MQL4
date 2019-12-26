//+------------------------------------------------------------------+
//|                                                 indicatorx71.mqh |
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
double MA_Value (int _period) {
   double _MA;
   string _MA_convert;
   double MA_OK;
    _MA = iMA(Symbol(),PERIOD_CURRENT,_period,0,MODE_SMA,PRICE_CLOSE,0);
   _MA_convert = DoubleToString(_MA,5);
   MA_OK = StringToDouble(_MA_convert);
   return MA_OK;
} 
double BB_UPPER_Value (int _period) {
   double _BB_upper;
   string _BB_upper_convert;
   double _BB_upper_OK;
   _BB_upper = iBands(Symbol(),PERIOD_CURRENT,_period,2,0,PRICE_CLOSE,MODE_UPPER,0);
   _BB_upper_convert = DoubleToString(_BB_upper,5);
   _BB_upper_OK = StringToDouble(_BB_upper_convert);
   return _BB_upper_OK;
}
double BB_LOWER_Vaule (int _period) {
   double _BB_lower;
   string _BB_lower_convert;
   double _BB_lower_OK;
   _BB_lower = iBands(Symbol(),PERIOD_CURRENT,_period,2,0,PRICE_CLOSE,MODE_LOWER,0);
   _BB_lower_convert = DoubleToString(_BB_lower,5);
   _BB_lower_OK = StringToDouble(_BB_lower_convert);
   return _BB_lower_OK;
}

double Convert_To_5_Value (double _value) {
  string _value_convert;
  double _value_ok;
  _value_convert = DoubleToString(_value,5);
  _value_ok = StringToDouble(_value_convert);
  return _value_ok;
}

double MACD_Vaule (int _fast, int _slow, int _singal) {
   double _result = NULL;
   _result = NormalizeDouble(iMACD(Symbol(),PERIOD_CURRENT,_fast, _slow, _singal,PRICE_CLOSE,MODE_SIGNAL,0),5);
   return _result;
   
}
