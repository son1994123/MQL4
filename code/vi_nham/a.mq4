//+------------------------------------------------------------------+
//|                                                            1.mq4 |
//|                                                        sonnguyen |
//|                                         https://webdanang43.net/ |
//+------------------------------------------------------------------+
#property copyright "sonnguyen"
#property link      "https://webdanang43.net/"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
double Get_Value_Number (double _number)
 {
  double Number_OK;
  Number_OK = DoubleToString(_number,5);
  return Number_OK;
  // Mục đích của hàm này là để chuyển số thập phân thành thập phân có 5 chữ số
 }
int BUY(double _lots, int _magicNumber, string _Comment) {
   int Ticket = OrderSend(Symbol(),OP_BUY,_lots,Ask,0,NULL,NULL,_Comment,_magicNumber,NULL,Green);
   return Ticket;
   // Hàm để BUY
}
int SELL(double _lots, int _magicNumber, string _Comment) {
   int Ticket = OrderSend(Symbol(),OP_SELL,_lots,Bid,0,NULL,NULL,_Comment,_magicNumber,NULL,Blue);
   return Ticket;
   // Hàm để SELL
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
  int total = OrdersTotal(); // Tổng các lệnh Order
  int Ticket_Number[1000]; // Biến Ticket_Number để lưu các mã Ticket lại
  double Lots_Order[1000]; // Lấy giá trị của LOt dánh của lệnh
  int Magic_Number[1000]; // Biến Magic Number để lưu các MagicNumber của lệnh
  double Price_Open_Order[1000]; // Lấy Giá mở của lệnh
  double Price_Close_Order[1000]; // Lấy giá đóng của lệnh
  double Profit_Order[1000]; // Lấy lợi nhuận của lệnh
  int Type_Of_Order[1000]; // Lấy loại lệnh gì?
  int Buy_Combo[100]; // Tên lệnh Buy nhiều lần
  int Hedge[100];
  int magic = 144;
  double Price[100];
  int Ticket_144[100]; // Bien luu ticket cua order 144
  int Ticket_144_temp[100];
 // double Type_1 = 
  for(int i=0;i<total;i++)
    {
     if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
       {
        Ticket_Number[i] = OrderTicket();
        Magic_Number[i] = OrderMagicNumber();
        Lots_Order[i] = OrderLots();
        Price_Open_Order[i] = OrderOpenPrice(); // Sẽ nhận giá mở cửa
        Price_Close_Order[i] = OrderClosePrice();
        Profit_Order[i] = OrderProfit();
        Type_Of_Order[i] = OrderType();     
       }
    }
    int Count = 0;
   double Price_Case_Buy =  Price_Open_Order[0] + 50*Point;
   double Price_Case_Hedge = Price_Open_Order[0] - 50*Point;
   double Price_Case_Buy_2 = Price_Open_Order[1] + 50*Point;
   double Price_Open[100];
   if(Close[0] > 0)
     {
      if(total == 0)
        {
         int Ticket_1 = BUY(0.1,144,"Buy_1");
         //Comment(Count_Magic_Number_144());
        } if(total == 1)
            {
             int Ticket_2 = BUY(0.1,144,"Buy_2");
             if(OrderSelect(Ticket_2,SELECT_BY_TICKET,MODE_TRADES))
               {
                Price_Open[0] = OrderOpenPrice();
               }
             if(Close[0] == (Price_Open[0] - 10*Point ) )
               {
                for(int i=0;i<total;i++)
                  {
                   if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
                     {
                      if(OrderMagicNumber() == 144)
                        {
                         Ticket_144_temp[i] = OrderTicket();
                        }
                     }
                  }
                  int Count = 0;
                 for(int i=0;i<total;i++)
                   {
                    if(Ticket_144_temp[i] >  0)
                      {
                       Ticket_144[Count] = Ticket_144_temp[i];
                       Count++;
                      }
                   }
                  for(int i=0;i<total;i++)
                    {
                     OrderClose(Ticket_144[i],0.1,Bid,0,White);
                    }
               }
            } if(total == 2)
                {
                 int Ticket_3 = BUY(0.1,144,"Buy_3");
                }
      
         
     }
  Comment(Count_Magic_Number_144());
   
 //  Comment(Price_Open_Order[1]);
    
     
  
  }
  int Count_Magic_Number_144 () {
  int Count_Magic_144;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 144)
           {
            Count_Magic_144++;
           }
        }
     }
     return Count_Magic_144;
   
  }
//+------------------------------------------------------------------+
