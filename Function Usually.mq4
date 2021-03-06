//+------------------------------------------------------------------+
//|                                                            3.mq4 |
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
//int total = OrdersTotal();
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
   double BID = Get_Value_Number(Bid);
   double CLOSE_0 = Get_Value_Number(Close[0]);
   double anchor[100];
   int Ticket[100];
   
  // Comment(Close_Of_Order(0));
   double SumProfit;
  if(Count_Magic_Number_144() == 0)
    {
      Ticket[0] = BUY(0.01,144,"BUY 1");
    }
    if(OrderSelect(Ticket[0],SELECT_BY_TICKET,MODE_TRADES))
      {
       anchor[0] = OrderOpenPrice()+ 0.003;
       return;
      }
    if(Count_Magic_Number_144() == 1)
      {
       if(Get_Value_Number(Close[0]) >= anchor[0])
         {
          Ticket[1] =  BUY(0.01,144,"BUY 2");
          return;
         }
      }
      if(OrderSelect(Ticket[1],SELECT_BY_TICKET,MODE_TRADES))
        {
         anchor[1] = OrderOpenPrice() + 0.003;
         return;
        }
     if(Count_Magic_Number_144() == 2)
       {
        if(Get_Value_Number(Close[0]) == anchor[1])
          {
            Ticket[2] = BUY(0.01,144,"BUY 3");
            return;
          }
       }
      if(OrderSelect(Ticket[2],SELECT_BY_TICKET,MODE_TRADES))
        {
         anchor[2] = OrderOpenPrice() + 0.003;
        } 
      if(Get_Value_Number(Close[0]) >= anchor[2]  )
        {
           if(Count_Magic_Number_144() == 3)
             {
              Ticket[3] = BUY(0.01,144,"BUY 4");
             }         
        }
      if(OrderSelect(Ticket[3],SELECT_BY_TICKET,MODE_TRADES))
        {
         anchor[3] = OrderOpenPrice() + 0.003;
        }
      if(Get_Value_Number(Close[0] >= anchor[3]))
        {
         if(Count_Magic_Number_144() == 4)
           {
            Ticket[4] = BUY(0.01,144,"BUY 5");
           }
        }
        
        
   Comment(anchor[0] +"\n "+ anchor[1]+ "\n"+ anchor[2] );
   
}


//+------------------------------------------------------------------+
// ham nay la de dem so Magic 144 cua lenh
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
//+------------------------------------------------------------------+
// Hàm này để Close 1 lệnh 
bool Close_Of_Order (int _number) {
   int Ticket; // Khai bao bien de leu Ticket
   double Lots; // Khai bao bien lOt de luu so lot cuar oder
   int Type; // bien Type de xem lenh do la lenh gi
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      Ticket = OrderTicket();
      Lots = OrderLots();
      Type = OrderType();
     }
   double Price;
   switch(Type)
     {
      case  0:
        Price = "Dang vao lenh BUY";
        break;
      case 1:
        Price = "Dang vao lenh SELL";
         break;
      default:
        break;
     }
   OrderClose(Ticket,Lots,Price,0,White);
   return 0;
}
//+------------------------------------------------------------------+

// Hàm lấy Profit của Số lệnh bất kỳ
double Profit_Of_Orders (int _number) {
   int Ticket;// lAY TICKET
   double Profit; // LUU PROFIT VAO BIEN
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      Ticket = OrderTicket();
     }
  if(OrderSelect(Ticket,SELECT_BY_TICKET,MODE_TRADES))
    {
     Profit = OrderProfit();
    }
    
   return DoubleToString(Profit);
}
//+------------------------------------------------------------------+
// Hàm lấy Lots của Order bất kỳ
double Lots_Of_Orders (int _number) {
   int Ticket;
   double Lots;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      Ticket = OrderTicket();
     }
   if(OrderSelect(Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      Lots = OrderLots();
     }
     
   return Lots;
}
//+------------------------------------------------------------------+
// Hàm Giá mở lệnh của Order bất kỳ 
double Open_Price_Orders (int _number) {
   int Ticket;
   double Open_Price;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      Ticket = OrderTicket();
     }
   if(OrderSelect(Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      Open_Price = OrderOpenPrice();
     }
   return Open_Price;
}
int Ticket_Of_Orders (int _number) {
   int Ticket;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      Ticket = OrderTicket();
     }
     
   return Ticket;
}
//+------------------------------------------------------------------+