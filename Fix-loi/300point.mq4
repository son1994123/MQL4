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

int Ticket_Global[100];
double Lots_Global[100];
double Order_Open_Price_Global[120];
double Profit_Global[100];
int Type_Global[100];
int Magic_Number_Global[100];
extern double Entry_Lots = 0.01;
extern int gap_pip = 300;
extern int many = 3;
//int gap_pip_pro = gap_pip*10;
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

   
   double Gia_Thanh_Toan_1,Gia_Thanh_Toan_2,Gia_Thanh_Toan_3;
   double Gia_Mua_1,Gia_Mua_2,Gia_Mua_3,Gia_Mua_4;
   int TotalX71 = (Count_Magic_1() + Count_Magic_144() + Count_Magic_145());
   double Ticket_1[100];
   
   if(TotalX71 == 0)
     {
      BUY(Entry_Lots,144,"Lenh Buy Dau Tien");// Lệnh BUY đầu tiên
     } 
    //  Comment(Ticket_Global[0] + "\n" + (Order_Open_Price_Global[0]+ 300*Point));  
      Assign_Ticket_Lots(); 
  
   if(Count_Magic_144() == 1)
     {
     if(Bid >= Get_Value_Number(Order_Open_Price_Global[0]+ 300*Point))
           {
             BUY(2*Entry_Lots,144,"Lenh Buy Dau Tien");// Lệnh BUY đầu tiên
           }
     }
  Assign_Ticket_Lots();
   if(Bid <= Gia_Thanh_Toan_1)
     {  
       if(Count_Magic_144() == 2)
         {
          OrderClose(Ticket_Global[0],OrderLots(),OrderClosePrice(),0,Red);
          OrderClose(Ticket_Global[1],OrderLots(),OrderClosePrice(),0,Red);
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
         Magic_Number_Global[i] = OrderMagicNumber();
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
