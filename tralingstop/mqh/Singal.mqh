//+------------------------------------------------------------------+
//|                                                       Singal.mqh |
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
bool Candle_How_Up (int _Candle_Of_Number) {
   bool _result = NULL;
   double _Candle;
   _Candle = Open[_Candle_Of_Number] - Close[_Candle_Of_Number];
   if(_Candle < 0)
     {
      _result = true;    /// true la khi nen tang
     } else
         {
            if(_Candle > 0)
              {
               _result = false;
              }
         }
    return _result;     
}
//

int Check_Candle_With_MA (int _Candle_Of_Number, int _MA_Check ) { //Cay nen can kiem tra
   bool _result = NULL;
   int _Check = NULL;
   double _MA = iMA(Symbol(),PERIOD_CURRENT,_MA_Check,0,MODE_SMA,PRICE_CLOSE,0);
   if(Open[_Candle_Of_Number] >= _MA && Close[_Candle_Of_Number] >= _MA)
     {
      _Check = 0; // NEN CAO HON MA
     }
   if(Open[_Candle_Of_Number] <= _MA && Close[_Candle_Of_Number] <= _MA)
     {
      _Check = 1; // Nen Thap hon MA
     }
   if(Open[_Candle_Of_Number] >= _MA && Close[_Candle_Of_Number] <= _MA)
     {
      _Check = 2; // Nen giam cat qua MA
     }
   if(Open[_Candle_Of_Number] <= _MA && Close[_Candle_Of_Number] >= _MA)
     {
      _Check = 3; // Nen tang cat qua MA
     }
        
   return _Check;
}