//+------------------------------------------------------------------+
//|                                               Check_BUY_SELL.mq4 |
//|                                   Copyright 2019, Son Nguyen Dev |
//|                                             https://g-saram.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, Son Nguyen Dev"
#property link      "https://g-saram.com/"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int BUY(double _lots, int _magic_number, string _comment, double _takeProfit) {
   int Ticket = OrderSend(Symbol(),OP_BUY,_lots,Ask,0,NULL,_takeProfit,_comment,_magic_number,NULL,Green);
   return Ticket;
}
int SELL(double _lots, int _magic_number, string _comment, double _take_profit) {
   int Ticket = OrderSend(Symbol(),OP_SELL,_lots,Bid,0,NULL,_take_profit,_comment,_magic_number,NULL,Yellow);
   return Ticket;
}
double Get_Value_Number (double _number) {
   double Number_OK;
   Number_OK = DoubleToString(_number,5);
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
   int until_144 = Count_Magic_Number_144() - 1; // Lấy số lệnh cuối cùng của order
   int until_145 = Count_Magic_Number_145() - 1; // Lấy số order cuối cùng của ticket 145
   double Order_Open_Price_1[100]; // biến lấy giá mở cửa của lệnh đầu tiên
   int total = OrdersTotal();
  if( total == 0) // VVào 6 lệnh
    {
     BUY(0.01,144,"Vao lenh",NULL);
    }
   //double Order_Open_Price_1[0] = Get_Order_Open_Price(0);
   Order_Open_Price_1[0] = Get_Order_Open_Price(0);
   Comment(Get_Order_Open_Price(0));
  if(Get_Value_Number(Bid - Get_Order_Open_Price(0)) == 0.0030)
    {
     if(Count_Magic_Number_145() == 0)
       {
        BUY(0.01,145,"Lenh Buy lien tuc",NULL);
       }
       return;
    }
  

    
  if( Get_Value_Number((Bid - Order_Open_Price_1[0])) == -0.0030)
    {
      if(Count_Magic_Number_145() == 0  )
        { 
         SELL(0.02,145,"Vao lenh HEDGE_1",NULL);
        }
    }
 whi
 
 
 
 
  // Comment(Order_Open_Price);
  
  }
//+------------------------------------------------------------------+
//--- Đếm lênh 144

int Count_Magic_Number_144 () {
   int Count;
   for(int i=0;i<OrdersTotal();i++)
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

//--- Đếm lệnh 145

int Count_Magic_Number_145 () {
   int Count;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 145)
           {
            Count++;
           }
        }
     }
     return Count;
}


// Hàm kiểm tra đó là lệnh BUY Or SELL nếu BUY là về 0, nếu SELL là về 1
int Check_BUY_SELL (int _number) {
   int until = Count_Magic_Number_145() - 1;
   int Open_Type;
   int Type;
   if(OrderSelect(until,SELECT_BY_POS,MODE_TRADES))
     {
      Open_Type = OrderType();
     }
   switch(Open_Type)
     {
      case  0:
        Type = 0;
        //Hàm BUY
        break;
      case 1:
         Type = 1;
         // Hamf Sell
         break;
      default:
        break; 
     } 
     return Type;
}
//--- Hàm lấy giá trị của OrderOpenPrice
double Get_Order_Open_Price (int _number) {
   int _Ticket;
   double _Order_Open_Price;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      _Ticket = OrderTicket();
     }
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _Order_Open_Price = OrderOpenPrice();
     }
     
  return _Order_Open_Price;   
}