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


int MagicNumber () {
          string _currency = Symbol();
    int _result = NULL;
    int _count = 0;
    string _array_current[]= {"EURUSD", "GBPUSD", "USDJPY", "AUDUSD", "EURGBP", "GBPJPY" ,"EURAUD","EURCHF" , "EURJPY", "GBPCHF", 
                              "CADJPY", "AUDCAD", "AUDCHF", "AUDJPY", "EURNZD", "USDCHF" , "EURCAD", "CADCHF", "NZDCHF", "NZDJPY" ,"NZDUSD","CADCHF","USDCAD",
                              "CHFJPY", "USDCHF", "NZDJPY", "NZDUSD", "XAUUSD", "XAGUSD", "AUDNZD","USDCNH","USDMXN","SGDJPY","USDTRY"};
 //-ChartApplyTemplate(0,"demo.tpl");
  int _array_current_siz = ArraySize(_array_current); // Đếm số phần tử trong mảng
  
   for(int i=0;i<_array_current_siz;i++)
     {
      if(_currency == _array_current[i])
        {
         _result = 144 + i ;
        } 
     
     }
     return _result;
}