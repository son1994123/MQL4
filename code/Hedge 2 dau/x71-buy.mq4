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
int BUY(double _lots, int _magic, string _comment)
  {
   int Ticket;
   Ticket = OrderSend(Symbol(),OP_BUY,_lots,Ask,0,NULL,NULL,_comment,_magic,NULL,Green);
   return Ticket;
  }
double Get_Value_Number(double _number)
  {
   double Number_OK;
   Number_OK = DoubleToString(_number,5);
   return Number_OK;
  }
int SELL(double _lots, int _magic, string _comment)
  {
   int Ticket;
   Ticket = OrderSend(Symbol(),OP_SELL,_lots,Bid,0,NULL,NULL,_comment,_magic,NULL,clrLemonChiffon);
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
   double Order_Open_Price_Special[11000]; // Tạo một mảng với 100 giá trị
   int Ticket[10000000]; // Tạo mảng lưu ticket
   int Ticket_1[100000]; //  Tạo mảng lưu ticket : dành cho magic number 144
   int Ticket_2[110000]; // Tạo mảng lưu Ticket : dành cho magic number : 1
   double Order_Open_Price_Loop[11000]; // Tạo mảng lưu các Giá mở cửa trong còng lpawj
   Assign_Ticket_Lots(); // Thực hiện gán ticket, lots, ...
   int Count_1= 0, Count_2 = 0, Count_0 = 0;
   int Dem = OrdersTotal() -1;
   
   double dcm;
    int sell_a =0, buy_a =0;
   
   if(Count_Magic_1() == 0 && Count_Magic_144() == 0 && Count_Magic_145() == 0)
     {
      Ticket_1[0] =  BUY(Entry_Lots,144,"Lenh Buy Dau Tien");// Lệnh BUY đầu tiên
     }
   if(OrderSelect(Ticket_1[0],SELECT_BY_TICKET,MODE_TRADES))
     {
      Order_Open_Price_Special[0] = OrderOpenPrice(); // Gán Giá mở cửa
     }
   if(Bid >= Order_Open_Price_Special[0] + 0.0030) // Dieu kien vao lenh #1
     {
      if(Count_Magic_1() == 0 && Count_Magic_144() == 1 && Count_Magic_145() == 0)// Dieu kien vao lenh #1
        {
         Ticket_1[1] =  BUY(Entry_Lots,144,"Lenh Buy Thu hai"); // Lenh buy thu 2
        }
      if(OrderSelect(Ticket_1[1],SELECT_BY_TICKET,MODE_TRADES)) // lựa chọn Lấy ticket
        {
         Order_Open_Price_Special[1] = OrderOpenPrice(); // gán giá mua lệnh buy 2 vào biến
        }  
     }
    double Close_1 = Order_Open_Price_Special[1] - 0.0010;
   if(Bid <= Get_Value_Number(Close_1)&& Count_Magic_1() == 0 && Count_Magic_145() == 0) // Nếu bid xuống 10 pip thì đủ đk thanh toán
     {
      if(Count_Magic_144() == 2) // Có 2 lệnh trước đó mới ddc thanh toán
        {
         OrderClose(Ticket_1[0],OrderLots(),OrderClosePrice(),0,White); // 2 câu lẹnh than toán
         OrderClose(Ticket_1[1],OrderLots(),OrderClosePrice(),0,White);
        }
     }
   if(Bid >= Order_Open_Price_Special[0] + 0.0060) // Điều kiện vào lệnh thứ 3 (1)
     {
      if(Count_Magic_1() == 0 && Count_Magic_144() == 2 && Count_Magic_145() == 0)// Dieu kien vao lenh thứ 3 (2)
        {
         Ticket_1[2] =  BUY(Entry_Lots,144,"Lenh Buy Thu Ba"); // Lenh buy thu 3
        }
      if(OrderSelect(Ticket_1[2],SELECT_BY_TICKET,MODE_TRADES)) // Lựa chọn ticket
        {
         Order_Open_Price_Special[2] = OrderOpenPrice(); // Gán giá mở cửa vô biến thứ 3
        }  
     }
   double Close_2 = Order_Open_Price_Special[2] - 0.0015;  // ddang bi loi cho nay
   if(Bid <= Get_Value_Number(Close_2) && Count_Magic_1() == 0 && Count_Magic_145() == 0 ) // Điều kiện thanh toán lệnh thứ 3
     {
      if(Count_Magic_144() == 3) // Nếu có 3 lệnh BUY 144 mới  thanh toán
        {
          OrderClose(Ticket_1[0],OrderLots(),OrderClosePrice(),0,clrDarkViolet); // 3 câu lẹnh than toán
          OrderClose(Ticket_1[1],OrderLots(),OrderClosePrice(),0,clrDarkViolet);
          OrderClose(Ticket_1[2],OrderLots(),OrderClosePrice(),0,clrDarkViolet);
        }
     }      
  if(Bid >= Order_Open_Price_Special[0] + 0.0090)
    {
     if(Count_Magic_1() == 0 && Count_Magic_144() == 3 && Count_Magic_145() == 0) // vao lenh 4
       {
        Ticket_1[3] = BUY(Entry_Lots,144,"Lenh Buy Thu Tu"); // Lệnh BUy THứ 4
       }
     if(OrderSelect(Ticket_1[3],SELECT_BY_TICKET,MODE_TRADES))
       {
        Order_Open_Price_Special[3] = OrderOpenPrice(); // Gán giá mở cửa lệnh 4 vào biến 
       }  
    }
  if(Bid <= Order_Open_Price_Special[2] && Count_Magic_1() == 0 && Count_Magic_145() == 0) // Điều kiện thanh toán 4 lệnh
    {
     if(Count_Magic_144() == 4 ) // Nếu có 4 lệnh BUY 144 mới  thanh toán
        {
          OrderClose(Ticket_1[0],OrderLots(),OrderClosePrice(),0,clrDarkViolet); // 4 câu lẹnh than toán
          OrderClose(Ticket_1[1],OrderLots(),OrderClosePrice(),0,clrDarkViolet);// 
          OrderClose(Ticket_1[2],OrderLots(),OrderClosePrice(),0,clrDarkViolet);
          OrderClose(Ticket_1[3],OrderLots(),OrderClosePrice(),0,clrDarkViolet);
        }
    }  
    // Bắt đầu quá trình BUY LIÊN TỤC
   
   for(int i=0;i<OrdersTotal() + 1;i++) 
     {
     string Loop_Comment = "Lenh Buy lien tuc thu" + (i+1); // Comment trong vòng lặp
     if(Bid >= (Order_Open_Price_Special[0] + (0.0030*(i+4)  )  )  )
       {
         if(Count_Magic_144() == 4 && Count_Magic_1() == i && Count_Magic_145() == 0) // Điều kiện để mua Order 1 lệnh
             {
             Ticket_2[i] = BUY(Entry_Lots,1,Loop_Comment); // Bắt đầu lệnh mua liên tục   
             }
            //return; 
       }
     
     if(Bid == (Get_Order_Open_Price(OrdersTotal() -2))  && Count_Magic_145() == 0)
       {
         
            for(int j=0;j <= ( OrdersTotal() +1 );j++)
              {
               OrderClose(Ticket_Global[j],Entry_Lots,Bid,0,Red);
               //Active_Order_Close_Pro(j);
              }
         while(OrdersTotal() > 0)
           {
            Active_Order_Close_Pro(Count_0);
            Count_0++;
           return;
           }
         
       }  
     
     }
     
  //--- Bat dau lenh HEDGE
     
   if(Bid <= Order_Open_Price_Special[0] - 0.0030)
     {
      if(Count_Magic_144() == 1 && Count_Magic_145() == (Dem))
        { 
       
         while( Type_Global[Dem] == 0)
           {
            SELL(3*Lots_Global[Dem],145,"Comment");
             return; 
           }         
        }
     }
   if(Bid <= Order_Open_Price_Special[0] - 0.0060 && Count_Magic_145 () > 0 )
     {
      while(OrdersTotal() > 0)
        {
         Active_Order_Close_Pro(Count_1);
         Count_1++;
         return;
        }
     }  // KHI THANH TOÁN XONG ĐOẠN NÀY THÌ PHẢI NHẢY LẠI TỪ ĐẦU 
    // THANH TOÁN RỒI ĐẾN ĐIỂM TIẾP THEO ĐÂY 
  //return;
     
   if(Bid >= Order_Open_Price_Special[0] + 0.0030)
     {
      if(Count_Magic_144() == 1 && Count_Magic_145() == (Dem)) {
        
            while(Type_Global[Dem] == 1)
              {
               BUY(3*Lots_Global[Dem],145,"Comment");
               return;
              }      
      }
     }
   if(Bid >= Order_Open_Price_Special[0] + 0.0060 && Count_Magic_145 () > 0)
     {
      while(OrdersTotal() > 0)
        {
         Active_Order_Close_Pro(Count_2);
         Count_2++;
         return;
        }
     }  
    
  



  }
//---

//-- Gán Ticket và Lóts
void Assign_Ticket_Lots()
  {
   for(int i=0; i<=OrdersTotal(); i++)
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
int amount_candle(int _number)
  {
   int _period = Period();
   int _amount_candle = _number * _period * 60 * 1000;
   return _amount_candle;
  }
//---


//---

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Get_Lots_Until()
  {
   double _Lots;
   double _Result;
   if(OrderSelect(Count_Magic_145(),SELECT_BY_POS,MODE_TRADES))
     {
      _Lots = OrderLots();
     }
   return _Lots;
  }
//---
int Count_Magic_1()
  {
   int Count;
   for(int i=0; i<OrdersTotal(); i++)
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


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Count_Magic_144()
  {
   int Count;
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
int  Count_Magic_145()
  {
   int Count;
   for(int i=0; i<OrdersTotal(); i++)
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
double Get_Order_Open_Price(int _number)
  {
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Active_Order_Close_Pro(int _number)
  {
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