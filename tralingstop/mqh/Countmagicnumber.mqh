//+------------------------------------------------------------------+
//|                                             Countmagicnumber.mqh |
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

int Count_Magic_Number_144 () {
int Count = 0;

   for(int i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 144)
           {
            Count++;
           }
        }
     }
   return Count;

}
int Count_Magic_Number_1 () {
int Count = 0;

   for(int i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 144)
           {
            Count++;
           }
        }
     }
   return Count;

}
int Count_Magic_Number_145 () {
int Count = 0;

   for(int i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 144)
           {
            Count++;
           }
        }
     }
   return Count;

}
int Count_Magic_Number_146 () {
int Count = 0;

   for(int i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 144)
           {
            Count++;
           }
        }
     }
   return Count;

}
int Count_Magic_Number_147 () {
int Count = 0;

   for(int i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 144)
           {
            Count++;
           }
        }
     }
   return Count;

}
