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
int BUY(double _lots, int _magic_number, string _comment) {
   int Ticket = OrderSend(Symbol(),OP_BUY,_lots,Ask,0,NULL,NULL,_comment,_magic_number,NULL,Green);
   return Ticket;
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
   int until = Count_Magic_Number_145() - 1; // Lấy số lệnh cuối cùng của order
  
  if(Count_Magic_Number_145() <= 5) // VVào 6 lệnh
    {
     BUY(0.01,145,"Vao lenh");
    }
    
    int Check = Check_BUY_SELL(until); // Kiểm tra xem đó là lệnh BUY Or SELL
 
    double Order_Open_Price; // Khai báo biến, biến này là biến để lưu giá trị Mở cửa của lệnh cuối cùng
    if(OrderSelect(until,SELECT_BY_POS,MODE_TRADES)) //
      {                                               // Hàm lấy giá OrderOpenPrice cuoois cung
       Order_Open_Price = OrderOpenPrice();           // 
      }                            
                         //
     double anchor = DoubleToString((Order_Open_Price - Bid) * 100000); // Biến này là biến khoảng cách giữa lệnh cuối cùng và giá hiện tại
     
  if(anchor == 60.0000 || anchor == -60.0000)
    {
     Comment(anchor) ;
    }
      
  // Comment(Order_Open_Price);
  
  }
//+------------------------------------------------------------------+
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