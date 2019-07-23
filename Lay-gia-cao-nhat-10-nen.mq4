//+------------------------------------------------------------------+
//|                                      Lay-gia-cao-nhat-10-nen.mq4 |
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
double GetNumber(double number){
double Number_ok;
Number_ok = DoubleToString(number);
return Number_ok;
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
   int Highest = iHighest(_Symbol,PERIOD_CURRENT,MODE_HIGH,20,0); // LAY VI TRI CAY NEN CO GIA COA NHAT TRONG VONG 20 CAY
   double Price_Of_Hightest = iHigh(_Symbol,PERIOD_CURRENT,Highest);
 //  Comment("Gia cao nhat trong 20 cay nen la: "+ GetNumber(Price_Of_Hightest));
   int Lowest = iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,20,0); //LAY VI TRI CAY NEN CO GIA THAP NHAT TRONG VONG 20 CAY
   double Price_Of_Lowest = iLow(_Symbol,PERIOD_CURRENT,Lowest);
   Comment("Gia thap nhat trong 20 cay nen la: " + GetNumber(Price_Of_Lowest));
  }
//+------------------------------------------------------------------+
