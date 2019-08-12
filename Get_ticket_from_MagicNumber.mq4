//+------------------------------------------------------------------+
//|                                  Get_ticket_from_MagicNumber.mq4 |
//|                                              Son Nguyen, G-saram |
//|                                         https://www.g-sarram.com |
//+------------------------------------------------------------------+
#property copyright "Son Nguyen, G-saram"
#property link      "https://www.g-sarram.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int BUY(double _lots) {
   int Ticket;
   string comment_order = "Lenh BUY magic :144";
   Ticket = OrderSend(_Symbol,OP_BUY,_lots,Ask,2,NULL,NULL,comment_order,144,NULL,Green);
   return Ticket;
}
int SELL(double _lots) {
   int Ticket;
   string comment_order = "Lenh SELL magic: 145";
   Ticket = OrderSend(_Symbol,OP_SELL,_lots,Bid,2,NULL,NULL,comment_order,145,NULL,Red);
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
   int Ticket_Of_Oders[1000];
   int Ticket_Of_Oders_145[1000];
   int Ticket_Of_Oders_144[1000];
   int total = OrdersTotal();
   
   if(Count_Magic_144() < 3)
     {
      BUY(0.1);
     }
   if(Count_Magic_145() < 3)
     {
      SELL(0.1);
     }
    for(int i=0;i<total;i++)
      {
       if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
         {
          if(OrderMagicNumber() == 144)
            {
             Ticket_Of_Oders[i] = OrderTicket();
            }
         }
      }
     int count_Ticket=0;
     for(int j=0;j<total;j++)
       {
        if(Ticket_Of_Oders[j] > 0)
          {
           Ticket_Of_Oders_144[count_Ticket] = Ticket_Of_Oders[j];
            cout_Ticket++;
          }
       }
      //
      //Comment("|" + Ticket_Of_Oders[0] + "|" + Ticket_Of_Oders[1] + "|" + Ticket_Of_Oders[2] + "|" + Ticket_Of_Oders[3] + "|" + Ticket_Of_Oders[4] + "|" + Ticket_Of_Oders[5] +"|" + Ticket_Of_Oders[6]      );
      Comment("|" + Ticket_Of_Oders_144[0]+"|" + Ticket_Of_Oders_144[1]+"|" + Ticket_Of_Oders_144[2]);
      
  }
//+--------------------------------------------------------
int Count_Magic_144() {
   int count = 0;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES) )
        {
         if(OrderMagicNumber() == 144)
           {
            count++;
           }
        }
     }
    return count;
}
int Count_Magic_145() {
   int count;
   for(int i=0;i<OrdersTotal();i++)
     {
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES) )
        {
         if(OrderMagicNumber() == 145 )
           {
            count++;
           }
        }
     }
   return count;
}
//+------------------------------------------------------------------+
