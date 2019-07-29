//+------------------------------------------------------------------+
//|                                             Huong_dan_select.mq4 |
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
enum bienluachon //bien nay jkhong hien ra nhung de luu vao select
  {
    default_Of_Var = 0,
    Name_Of_Var_1 = 1, // Name Of Var la hien thi ra man hinh sau do no co gia tri the nao
    Name_Of_Var_2 = 2,
    Name_Of_Var_3 = 3,
    Name_Of_Var_4 = 4,
    Name_Of_Var_5 = 5, 
  };
input bienluachon hienramanhinh = 0;
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
   Comment("In ra: " + hienramanhinh);
  }
//+------------------------------------------------------------------+
