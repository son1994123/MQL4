//+------------------------------------------------------------------+
//|                                                  MagicNumber.mq4 |
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
   double bbtren = iBands(_Symbol,PERIOD_CURRENT,20,2,0,PRICE_CLOSE,MODE_UPPER,0);
   double bbduoi = iBands(_Symbol,PERIOD_CURRENT,20,2,0,PRICE_CLOSE,MODE_LOWER,0);
   int total = OrdersTotal();
   
  // if(OrderSelect(0,SELECT_BY_POS,MODE_TRADES))
  //   {
   int Check;
   if(Bid < bbtren || Bid > bbduoi)
     {
      Check = 1;
     }
   if(Bid > bbtren)
     {
      Check = 2;
     }
   if(Bid < bbduoi)
     {
      Check = 3;
     }
     int cout;
      
      
    // }
  // Comment("gia tri no la: "+ TotalordersCount());
  }
  
int TotalordersCount()
  {
  int result = 0;
       for(int i=0;i<OrdersTotal();i++)
      {
       OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
       if(OrderMagicNumber() == 144)
         {
          result++;
         }.
      }
      return(result);
  }
//+------------------------------------------------------------------+
