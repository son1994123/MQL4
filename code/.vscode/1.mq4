//+------------------------------------------------------------------+
//|                                                          abs.mq4 |
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

int Ticket_Global[1000];
double Lots_Global[1000];
double Order_Open_Price_Global[1200];
double Profit_Global[1000];
int Type_Global[1000];
extern double Entry_Lots = 0.01;
int BUY(double _lots, int _magic, string _comment) {
   int Ticket;
   Ticket = OrderSend(Symbol(),OP_BUY,_lots,Ask,0,NULL,NULL,_comment,_magic,NULL,Green);
   return Ticket;
   }
double Get_Value_Number (double _number) {
   double Number_OK;
   Number_OK = DoubleToString(_number,5);
   return Number_OK;
}
int SELL(double _lots, int _magic, string _comment,double _takeProfit) {
   int Ticket;
   Ticket = OrderSend(Symbol(),OP_SELL,_lots,Bid,0,NULL,_takeProfit,_comment,_magic,NULL,Green);
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
  int total = OrdersTotal() + 1; // Điều kiện khiến cho vòng lặp vô hạn
  double Order_Open_Price_Special[110]; // Tạo một mảng với 100 giá trị
  int Ticket[1000]; // Tạo mảng lưu ticket
  int Ticket_1[100]; //  Tạo mảng lưu ticket : dành cho magic number 144
  int Ticket_2[1100]; // Tạo mảng lưu Ticket : dành cho magic number : 1
  double Order_Open_Price_Loop[1100]; // Tạo mảng lưu các Giá mở cửa trong còng lpawj
  Assign_Ticket_Lots(); // Thực hiện gán ticket, lots, ...
  int Count;  
   double dcm;
  if( Count_Magic_1() == 0 && Count_Magic_144() == 0 && Count_Magic_1() == 0)
    {
      Ticket_1[0] =  BUY(Entry_Lots,144,"Lenh Buy Dau Tien");// Lệnh BUY đầu tiên
    }
   if(OrderSelect(Ticket_1[0],SELECT_BY_TICKET,MODE_TRADES))
     {
      Order_Open_Price_Special[0] = OrderOpenPrice(); // Gán Giá mở cửa
     }  
    
   
   if( Bid >= Get_Value_Number(Order_Open_Price_Special[0] + 0.0030)  ) // Nếu giá Bid = Giá vào lệnh của thằng BUY 1 thêm 30 pip
     {
      if(Count_Magic_1() == 0 && Count_Magic_144() == 1 && Count_Magic_1() == 0)
        {
       Ticket_1[1] = BUY(Entry_Lots,144,"Lenh BUY Thu Hai (2) "); // Lệnh Buy thứ 2
       
        } 
       if(OrderSelect(Ticket_1[1],SELECT_BY_TICKET,MODE_TRADES))
           {
            Order_Open_Price_Special[1] = OrderOpenPrice(); // Lưu biến Giá mở cửa của lebnegj Buy 2
           }  
        
    
     }
     dcm = Order_Open_Price_Special[1] - 0.0010;   
      if(Bid <= dcm && Count_Magic_144() == 2)
       {
           OrderClose(Ticket_Global[0],OrderLots(),OrderClosePrice(),0,Red);
           OrderClose(Ticket_Global[1],OrderLots(),OrderClosePrice(),0,Red);
          
       }
     if(Bid >= Get_Value_Number(Order_Open_Price_Special[0] + 0.0060) )
       {
       if(Count_Magic_144() == 2 && Count_Magic_1() == 0 && Count_Magic_1() == 0)
         {
         Ticket_1[2] =  BUY(Entry_Lots,144,"Lenh Buy Thu Ba (3)"); // Lệnh buy 3
         }
       if(OrderSelect(Ticket_1[2],SELECT_BY_TICKET,MODE_TRADES))
         {
          Order_Open_Price_Special[2] = OrderOpenPrice(); // Lưu biến giá mở cửa của lệnh 3
         }  
       } 
     double dcm2;
     dcm2 = Order_Open_Price_Special[2] - 0.0015;  
      if(Bid <= Get_Value_Number(dcm2) && Count_Magic_144() == 3 &&  Count_Magic_1() == 0)
        {       
         OrderClose(Ticket_Global[0],OrderLots(),OrderClosePrice(),0,Red);
         OrderClose(Ticket_Global[1],OrderLots(),OrderClosePrice(),0,Red);
         OrderClose(Ticket_Global[2],OrderLots(),OrderClosePrice(),0,Red);
        }       
    if(Bid >= Get_Value_Number(Order_Open_Price_Special[0] + 0.0090)  ) // Điều kiện để vào lệnh Buy thứ 4
      {
       if(Count_Magic_144() == 3 && Count_Magic_1() == 0 &&  Count_Magic_1() == 0)
         {
          Ticket_1[3] = BUY(Entry_Lots,144,"Lenh Buy Thu tu (4)"); // Lệnh Buy thứ 4
         }
       if(OrderSelect(Ticket_1[3],SELECT_BY_TICKET,MODE_TRADES))
         {
          Order_Open_Price_Special[3] = OrderOpenPrice(); // gán giá mở cửa của lệnh BUy thứ 4
         }  
      }
     if(Bid <= Order_Open_Price_Special[2] && Count_Magic_144() == 4) // Điều kiện thanh toán hết
       {
         OrderClose(Ticket_Global[0],OrderLots(),OrderClosePrice(),0,Red);
         OrderClose(Ticket_Global[1],OrderLots(),OrderClosePrice(),0,Red);
         OrderClose(Ticket_Global[2],OrderLots(),OrderClosePrice(),0,Red);
         OrderClose(Ticket_Global[3],OrderLots(),OrderClosePrice(),0,Red);
       }
     
   //Comment()
     for(int i=0;i<=OrdersTotal() + 1 ;i++) //(int i=0;i<=total;i++
       {
       string Loop_Comment = "Lenh Buy lien tuc thu" + (i+1); // Comment trong vòng lặp // i+1
        if( Bid >= ( Order_Open_Price_Special[0] + (0.0030*(i+4) ) ) ) // Điều kiện vào lệnh (Giá lệnh mua đầu tiên + 0.009 * 1 -2 -3 -4 -5 ...)
          {
           if(Count_Magic_144() == 4 && Count_Magic_1() == i) // Điều kiện để mua Order 1 lệnh
             {
             Ticket_2[i] = BUY(2*Entry_Lots,1,Loop_Comment); // Bắt đầu lệnh mua liên tục  
             }    
          } // Ket thuc dieu kien vao lenh 
      if(Bid <= Get_Value_Number(Get_Order_Open_Price(OrdersTotal() - 2)))
        {
         for(int i=0;i<=OrdersTotal()+2;i++)
           {
            OrderClose(Ticket_Global[i],Lots_Global[i],Bid,0,Red);
           }
        } 

       }   
  int for(int i=OrdersTotal()-1;i>=0;i--)
  {
     if(OrderSelect(i,SELECT_BY_POS) && OrderSymbol() == _Symbol  other conditions)
     {
        
     }
  }
  
  
 
 
}
//---

//-- Gán Ticket và Lóts
void Assign_Ticket_Lots () {
   for(int i=0;i<=OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         Ticket_Global[i] = OrderTicket();
         Lots_Global[i] = OrderLots();
         Order_Open_Price_Global[i] = OrderOpenPrice();
         Type_Global[i] = OrderType();
         Profit_Global[i] =  OrderProfit();
         
        }
     }
  //   return;
}
      
//---
int amount_candle(int _number) {
   int _period = Period();
   int _amount_candle = _number * _period * 60 * 1000;
   return _amount_candle;
}
//---


//---

double Get_Lots_Until () {
   double _Lots;
   double _Result;
   if(OrderSelect(Count_Magic_145(),SELECT_BY_POS,MODE_TRADES))
     {
      _Lots = OrderLots();
     }
     return _Lots;
}
//---
int Count_Magic_1 () {
   int Count;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 1)
           {
            Count++;
           }
        }
     }
     return Count;
}
//---


int Count_Magic_144 () {
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
int  Count_Magic_145 () {
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
 
  
//---
double Get_Order_Open_Price (int _number)  {
   double _OrderOpenPrice;
   int _Ticket;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
   //   _OrderOpenPrice = OrderOpenPrice();
        _Ticket = OrderTicket();
     }
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
        _OrderOpenPrice = OrderOpenPrice(); 
     }
  return _OrderOpenPrice;
}
//---
 
bool Active_Order_Close_Pro (int _number ) {
   int _ticket;
   double _lots;
   int _type;
   double _price;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      _ticket = OrderTicket();
      _lots = OrderLots();
      _type = OrderType();
     }
   switch(_type)
     {
      case  0:
        _price = Bid;
        break;
      case 1:
         _price = Ask;
         break;  
      default:
        break;
     }  
    OrderClose(_ticket,_lots,_price,0,Red); 
    return 0;
}  

//+------------------------------------------------------------------+
