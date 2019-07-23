//+------------------------------------------------------------------+
//|                                         functionreturnarrray.mq4 |
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
#include <getticket.mqh>
double GetNumber(double number) {
   double Number = DoubleToString(number,5);
   return Number;
}

//string hello;
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
   double BB_UPPER = iBands(_Symbol,PERIOD_CURRENT,20,2,0,PRICE_CLOSE,MODE_UPPER,0);
   double Bar = iBars(_Symbol,PERIOD_CURRENT);
   double Hight = iHigh(_Symbol,PERIOD_CURRENT,0);
   int Hightest = iHighest(NULL,0,MODE_HIGH,5,0);
   int Lowest = iLowest(_Symbol,PERIOD_CURRENT,MODE_LOW,5,0);
   //Comment(Lowest);
   //Ham lay nen cao nhat
   double Price_Hightest = iHigh(_Symbol,PERIOD_CURRENT,Hightest);
 //  Comment("Gia coa nhat la: "+ GetNumber(Price_Hightest));
   double Price_Lowest = iLow(_Symbol,PERIOD_CURRENT,Lowest);
   Comment("Gia thap nhat la: " + GetNumber(Price_Lowest));   
  }
//+------------------------------------------------------------------+
