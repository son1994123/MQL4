//+------------------------------------------------------------------+
//|                                                  OpenOrClose.mq4 |
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
  int total = OrdersTotal();
  double Price_Close, Price_Open;
  for(int i=0;i<total;i++)
    {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         Price_Close = OrderClosePrice();
         Price_Open = OrderOpenPrice(); // Nhận giá Open khi vào lệnh
        } 
    }
   Comment("Close: "+ Price_Close + "|"+ "Open" + Price_Open);
  }
//+------------------------------------------------------------------+
