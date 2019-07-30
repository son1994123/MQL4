//+------------------------------------------------------------------+
//|                                                 Check_Candle.mq4 |
//|                                              Son Nguyen, G-saram |
//|                                         https://www.g-sarram.com |
//+------------------------------------------------------------------+
#property copyright "Son Nguyen, G-saram"
#property link      "https://www.g-sarram.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
double Get_Value_Number(double number) {
   double Number_OK;
   Number_OK = DoubleToString(number,5);
   return Number_OK;
}
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
   double MA_Value = iMA(_Symbol,PERIOD_CURRENT,10,0,MODE_SMA,PRICE_CLOSE,0);
   double MA = Get_Value_Number(MA_Value);
   int Check;
   double value = Close[1] - Open[1];
   //Comment("MA: " + MA);
   if(Open[1] <= MA && Close[1] >= MA)
     {
      Check = 1;
      //nen cat tang
     }
    if(Open[1] >= MA && Close[1] <= MA )
      {
       Check = 2;
       //nen cat giam
      }
    if(Open[1] >= MA && Close[1] >= MA && value > 0)
      {
       Check = 3;
       // Nen o tren MA tang
      }
     if(Open[1] >= MA && Close[1] >= MA && value < 0 )
       {
        Check = 4;
        // Nen o tren MA giam
       }
      if(Open[1] <= MA && Close[1] <= MA && value > 0)
        {
         Check = 5;
         //Nen o duoi MA Tang
        }
       if(Open[1] <= MA && Close[1] <= MA && value < 0)
         {
          Check = 6;
          // Nen o duoi MA giam
         }
        
        
       switch(Check)
         {
          case  1:
            Comment("Nen cat MA Tang");
            break;
          case 2:
             Comment("Nen cat MA giam");
             break;
          case 3:
             Comment("Nen nam tren MA dang Tnang");
             break;
          case 4:
             Comment("Nen nam tren MA dang giam");
             break;
           case 5:
              Comment("Nen nam tren MA dang tang");
              break;
           case 6:
              Comment("Nen nam duoi MA dang giam");
              break;
          default:
               Comment("Kiem tra lai nene");
            break;
         }
    
     
   
  }
//+------------------------------------------------------------------+
