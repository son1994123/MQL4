//+------------------------------------------------------------------+
//|                                                        abs-1.mq4 |
//|                                   Copyright 2019, Son Nguyen Dev |
//|                                             https://g-saram.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, Son Nguyen Dev"
#property link      "https://g-saram.com/"
#property version   "1.00"
#property strict
#import C:\Users\MYDATA\AppData\Roaming\MetaQuotes\Terminal\98A82F92176B73A2100FCD1F8ABD7255\MQL4\Include\Canvas\Canvas.dll
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
    if(Count_Magic_144() == 1)
     {
      if(Get_Value_Number(Bid - Get_Order_Open_Price(Count_Magic_145()) ) >= 0.0060)
        {
         if(Count_Magic_145() == 1)
           {
            BUY(0.01,145,"SELL_ HEDGE 2"); // Count 145 = 2
           }
        }
     }
   if(Count_Magic_144() == 1)
     {
      if(Get_Value_Number(Bid - Get_Order_Open_Price(Count_Magic_145()))  <= -0.0060)
        {
         if(Count_Magic_145() == 2)
           {
            SELL(0.01,145,"SELL _ HEDGE 3"); // Count 145 = 3
           }
        }
     }
   if(Count_Magic_144() == 1)
     {
      if(Get_Value_Number(Bid - Get_Order_Open_Price(Count_Magic_145() ) ) >= 0.0060)
        {
         if(Count_Magic_145() == 3)
           {
            BUY(0.01,145,"BUY - HEDGE 4"); // Count 145 = 4
           }
        }
     }
   if(Count_Magic_144 () == 1)
     {
      if(Get_Value_Number(Bid - Get_Order_Open_Price(Count_Magic_145() )) <= -0.0060)
        {
         if(Count_Magic_145() == 4)
           {
            SELL(0.01,145,"SELL - HEDGE 5"); // cOUNT 145 = 5 
           }
        }
     }     
   if(Count_Magic_144() == 1)
     {
      if(Get_Value_Number(Bid - Get_Order_Open_Price(Count_Magic_145())) >= 0.0060)
        {
         if(Count_Magic_145() == 5)
           {
            BUY(0.01,145,"SELL - HEDGE 6"); //Count 145 = 6
           }
        }
     }
   
  }
//+------------------------------------------------------------------+
