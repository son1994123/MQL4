//+------------------------------------------------------------------+
//|                                                 Function_Buy.mq4 |
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
   string comment_Order = "Lenh Buy";
   Ticket = OrderSend(_Symbol,OP_BUY,_lots,Ask,2,NULL,NULL,comment_Order,144,NULL,Green);
   Comment("ticket" + Ticket);
   return Ticket;
}
int SELL(double _lots) {
   int Ticket;
   string Comment_Order = " Lenh Sell";
   Ticket = OrderSend(_Symbol,OP_SELL,_lots,Bid,2,NULL,NULL,Comment_Order,144,NULL,Red);
   return Ticket;
   
}

double Get_Value_Number(double _number) {
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

   double BB_UPPER = iBands(_Symbol,PERIOD_CURRENT,20,2,0,PRICE_CLOSE,MODE_UPPER,0);
   double BB_LOWER = iBands(_Symbol,PERIOD_CURRENT,20,2,9,PRICE_CLOSE,MODE_LOWER,0);
   double MA_SIXTY = iMA(_Symbol,PERIOD_CURRENT,60,0,MODE_SMA,PRICE_CLOSE,0);
   int total = OrdersTotal();
   int check;
   if(Get_Value_Number(MA_SIXTY) > Get_Value_Number(BB_UPPER))
     {
     check = 1;
     
     // MA-60 ra ngoai B
     }
   if(Get_Value_Number(MA_SIXTY) < Get_Value_Number(BB_LOWER) )
     {
      check = 2;
      //MA-60 nam duoi BB
     }  
     double GAP_PIP_UPPER = (Get_Value_Number(MA_SIXTY) -  Get_Value_Number(BB_UPPER) ) * 10000;
     double GAP_PIP_LOWER = (Get_Value_Number(BB_LOWER) - Get_Value_Number(MA_SIXTY)) * 10000;
     int magic_number = 144;
   switch(check)
     {
      case 1:
        if( GAP_PIP_UPPER > 15.0000)
          {
           if(Close[0] == Get_Value_Number(BB_UPPER))
             {
             BUY(0.01);
               magic_number = magic_number + 1;
              Comment("SELL" + magic_number);
             }
          }
        break;
       case 2:
         if(GAP_PIP_LOWER < 15.0000)
           {
            if(Close[0] == Get_Value_Number(BB_LOWER))
              {
              // Comment("Vao lenh bUy");
               magic_number = magic_number + 1;
               Comment("BUY" + magic_number++);
              }
           }
          break;
      default:
      Comment("Khong thoa dieu kien vao lenh");
        break;
     }
 }
//+------------------------------------------------------------------+
