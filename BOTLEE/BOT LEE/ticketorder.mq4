//+------------------------------------------------------------------+
//|                                                     asdasdasd.mq4 |
//|                                           Son Nguyen Development |
//|                                         https://webdanang43.net/ |
//+------------------------------------------------------------------+
#property copyright "Son Nguyen Development"
#property link      "https://webdanang43.net/"
#property version   "1.00"

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//--- 
    string _currency = Symbol();
    int _result = NULL;
    int _count = 0;
    string _array_current[]= {"EURUSD", "GBPUSD", "USDJPY", "AUDUSD", "EURGBP", "GBPJPY" ,"EURAUD","EURCHF" , "EURJPY", "GBPCHF", 
                              "CADJPY", "AUDCAD", "AUDCHF", "AUDJPY", "EURNZD", "USDCHF" , "EURCAD", "CADCHF", "NZDCHF", "NZDJPY" ,"NZDUSD","CADCHF","",
                              "CHFJPY", "USDCHF", "NZDJPY", "NZDUSD", "XAUUSD", "XAGUSD"};
  ChartApplyTemplate(0,"60ma.tpl");
  int _array_current_siz = ArraySize(_array_current); // Đếm số phần tử trong mảng
  
   for(int i=0;i<_array_current_siz;i++)
     {
      if(_currency == _array_current[i])
        {
         _result = 144 + i ;
        } 
     
     }
     Comment("aaaaaaaa");
  }
//+------------------------------------------------------------------+
