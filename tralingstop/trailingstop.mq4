//+------------------------------------------------------------------+
//|                                                 trailingstop.mq4 |
//|                                           Son Nguyen Development |
//|                                         https://webdanang43.net/ |
//+------------------------------------------------------------------+
#property copyright "Son Nguyen Development"
#property link      "https://webdanang43.net/"
#property version   "1.00"
#property strict
#include <trailing_stop.mqh>
#include <Order_Send.mqh>
#include <Get_Order.mqh>
#include <indicatorx71.mqh>
#include <Countmagicnumber.mqh>
input int Traling_Stop = 5;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
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
  double Traling_Stop_Point =  Convert_To_Pip(Traling_Stop);
  double Subtract = NULL;
  double trailing_2 = NULL;
  double Open_Order_Demo = NULL;
  int Ticket = NULL;
  double New_StopLoss = NULL;
  double Open_Order = NULL;
  double Max = NULL;
  double Stop_Loss_Ticket = NULL;
  int Flag = 2;
  bool _result = NULL;
  double Stop_Loss_Now = NULL;
  double Stop_Loss_New = NULL;
  if(Count_Magic_Number_144() == 0)
    {
     OrderSend(Symbol(),OP_BUY,0.01,Ask,5,(Bid - Traling_Stop_Point),NULL,"dEMO MAU",144,NULL,Red);
        // vào 1 lệnh xem thử
    }
  Ticket = Get_Ticket(0); // lấy Ticket
   Open_Order_Demo = Get_Open_Oder_Price(Ticket);  // Lấy giá mở
    Max = Get_Stop_Loss(Ticket); // gán giá mở vào mãx
    Subtract = NormalizeDouble( Bid - Traling_Stop_Point,5); // khoảng cách của bid và Sl
    Stop_Loss_Ticket = Get_Stop_Loss(Ticket); // laays gias tri cuar SL hien tai
     if(Subtract >= Max)
      {
          _result = OrderModify(Ticket,Open_Order_Demo,Subtract,NULL,NULL,Yellow);
         // Max = Stop_Loss_Ticket;
       if(_result == true)
         {
          Max = Get_Stop_Loss(Ticket);
         }
       
       }
    Comment("La gia SL dang di chuyen"+Subtract+ "\n" + "SL dang " +Max + "\n" + _result);
  }
//+------------------------------------------------------------------+
