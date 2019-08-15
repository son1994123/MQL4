//+------------------------------------------------------------------+
//|                                                     DO-white.mq4 |
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
int BUY(double _lots, int _magicNumber, string _Comment) {
   int Ticket = OrderSend(Symbol(),OP_BUY,_lots,Ask,0,NULL,NULL,_Comment,_magicNumber,NULL,Green);
   return Ticket;
   // Hàm để BUY
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
//int i=0;
//int count =
//double anchor;
//int count = 1;
int Ticket[100];
double Lots[100];
  if(Count_Magic_Number_144() == 0)
    {
     BUY(0.01,144,"buy 0");
  //   Comment(Count_Magic_Number_144());
    }
    for(int a=0;a<OrdersTotal();a++)
              {
               if(OrderSelect(a,SELECT_BY_POS,MODE_TRADES))
                 {
                   Ticket[a] = OrderType();
                   Lots[a] = OrderLots();
                 }
              }
  for(int i=0;i<10;i++)
    {
    //int count;
      string comment = "buy_"+(i+1);
     if(Count_Magic_Number_144() == (i+1))
       {
       if( Close[0] >= (Open_Price_Orders(0) + ((300*Point)*(i+1))  )  )
         {
          BUY(0.1,144,comment);
          //count++;  
         }
         //Comment( Open_Price_Orders(i)+"\n"+ Bid);
         //--
         double temp = Open_Price_Orders(i-1);
        // Comment(temp);
         if(Close[0] >= temp )
           {
            //bool close = Close_Of_Order(0);
            //Comment(string(close) + "\n" + (Open_Price_Orders(i) - (300*Point)) );
            for(int a=0;a<OrdersTotal();a++)
              {
               if(OrderSelect(a,SELECT_BY_POS,MODE_TRADES))
                 {
                  Ticket[a] = OrderTicket();
                  Lots[a] = OrderLots();
                 }
              }
               Comment(temp+ "\n"+Ticket[i]+ "\n"+ Lots[i]);
          // 
            
           // for(int a=0;a<OrdersTotal();a++)
             // {
              // OrderClose(Ticket[a],Lots[a],Ask,0,White);
              //}
           }
       }
        
    }
   //anchor = (Open_Price_Orders(i));
  }
//+------------------------------------------------------------------+
int Count_Magic_Number_144 () {
   int Count;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderMagicNumber() == 144)
        {
         Count++;
        }
     }
     return Count;
}
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