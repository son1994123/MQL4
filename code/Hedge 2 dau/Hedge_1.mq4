//+------------------------------------------------------------------+
//|                                                      Hedge_1.mq4 |
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
//#import "demo.qmh"

//#import
extern double lots = 0.01;
double Get_Value_Number (double _number) {
   double Number_OK;
   Number_OK = DoubleToString(_number,5);
   return Number_OK;
}
int BUY(double _lots, int _magic_number, string _comment, double _take_profit) {
   int Ticket = OrderSend(Symbol(),OP_BUY,_lots,Ask,0,NULL,_take_profit,_comment,_magic_number,NULL,Green);
   return Ticket;
}
int SELL(double _lots, int _magic_number, string _comment, double _take_profit) {
   int Ticket = OrderSend(Symbol(),OP_SELL,_lots,Bid,0,NULL,_take_profit,_comment,_magic_number,NULL,Yellow);
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
  double Gap_pip[100];
  int Ticket[100];
   int Ticket_145[100];
  int Ticket_Temp[100] ;
  double Order_Open_Price[100];
  double Order_Lots[100];
  int Count_Ticket= 0;
  int total = OrdersTotal();
  int Until = Count_Magic_Number_145() - 1;
  
  for(int i=0;i<5;i++)
    {
     if(Count_Magic_Number_145() == i)
       {
        BUY(0.01,145,"Lenh",Ask+50*Point);
       }
    }
    
   Gap_pip[0] = (Bid - Get_Order_Open_Price(0))*10000;
  //Comment("In ra: "+ Get_Value_Number(Gap_pip[0]));
  for(int i=0;i<OrdersTotal();i++)
    {
     if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
       {
         if(OrderMagicNumber() == 145)
           {
            Ticket_Temp[i] = OrderTicket();
           }     
       }
    }
  for(int j=0;j<OrdersTotal();j++)
    {
     if(Ticket_Temp[j] > 0)
       {
         Ticket_145[Count_Ticket] = Ticket_Temp[j];
         Count_Ticket++;
       }
    }
    
   Comment(Ticket_145[Until]); 
   //---
   
  if(Get_Value_Number(Gap_pip[0]) == 30.0000)
    {
      //   Comment("Vao lenh buy lien tuc");    
    }
  if(Get_Value_Number(Gap_pip[0]) ==  -30.0000)
    {
     // Comment("Vao lenh Hedge");
     if(Count_Magic_Number_144() == 1 )
       {
        SELL((3*lots),144,"HEDGE_SELL_1",(Bid - 300*Point));
       } 
    }
    
    
  }
//#import
  
//+------------------------------------------------------------------+
int Count_Magic_Number_144 () {
   int count;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 144)
           {
            count++;
           }
        }
     }
     return count;
}
int Count_Magic_Number_145 () {
   int count;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == 145)
           {
            count++; 
           }
        }
     }
     return count;
}
// Lay gia Open Price
double Get_Order_Open_Price(int _number) {
   int Ticket;
   double Order_Open_Price;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES))
     {
      Ticket = OrderTicket();
     }
   if(OrderSelect(Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      Order_Open_Price = OrderOpenPrice();
     }
   return Order_Open_Price;
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
        //Price = "Dang vao lenh BUY";
       Price = Bid;
        break;
      case 1:
        Price = Ask;
         break;
      default:
        break;
     }
   OrderClose(Ticket,Lots,Price,0,White);
   return 0;
}