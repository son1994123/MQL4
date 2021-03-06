//+------------------------------------------------------------------+
//|                                           nholaitrailingstop.mq4 |
//|                                           Son Nguyen Development |
//|                                         https://webdanang43.net/ |
//+------------------------------------------------------------------+
#property copyright "Son Nguyen Development"
#property link      "https://webdanang43.net/"
#property version   "1.00"

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
#include <taplenhordersend.mqh>
input int KhoangcachSL = 5;
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
   int Ticket_Order[20];
   double KhoangcachPIPSL = KhoangcachSL * 10 * Point; 
   double Max  = NULL; // bien Max là biến SL cao nhất có thể
   double Subtract_Buy = NULL; // Đây là giá trị giữa đường Bid và khoảng cảnh cần SL của lệnh BUY
   int TongLenh = OrdersTotal();
   bool result = FALSE;
  
   if(TongLenh == 0)
     {
      BUY_SL(0.01,KhoangcachPIPSL,"Lenh Vi DU ", 0) ;
     }
     
 //  TicketOrder(0);  
   GetOpenOrderPrice(TicketOrder(0));  //Lấy giá mở của lệnh
    Max = GetOrderStopLoss(TicketOrder(0));  // Gán SL hiện tại là giá trị Lớn nhất mà trailing đạt được
    Subtract_Buy = NormalizeDouble((Bid - KhoangcachPIPSL),5); // Lấy giá trị mà trailing hiện tại
   if(Subtract_Buy >= Max)
     {
     result = OrderModify(TicketOrder(0),GetOpenOrderPrice(TicketOrder(0)),Subtract_Buy,GetOrderTakeProfit(TicketOrder(0)),NULL,clrMediumSpringGreen);
     if(result == true)
       {
        Max = GetOrderStopLoss(TicketOrder(0));
       }
     }  
     
   Comment("Ticket Order la: "+ TicketOrder(0) + " - Gia mo lenh 1 la: " 
   + GetOpenOrderPrice(TicketOrder(0)) + " - Khoang cach hien tai: "+ Subtract_Buy + 
    " - SL hien tai la: "+ GetOrderStopLoss(TicketOrder(0)) ); 
     
  }
//+------------------------------------------------------------------+
// Lấy Ticket của lệnh
int TicketOrder(int _number) {
   int _TicketOrder = NULL;
   if(OrderSelect(_number,SELECT_BY_POS,MODE_TRADES) )
     {
      _TicketOrder = OrderTicket();
     }
     return _TicketOrder;

} 
// Lấy giá mở của lệnh
double GetOpenOrderPrice (int _Ticket) { // 
   double _OrderOpenPrice = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _OrderOpenPrice = OrderOpenPrice();
     }
     return _OrderOpenPrice;
}
// Lấy Giá SL của lệnh
double GetOrderStopLoss (int _Ticket) {
   double _OrderStopLossPrice = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _OrderStopLossPrice = OrderStopLoss();
     }
     return _OrderStopLossPrice;
}
//+------------------------------------------------------------------+
//| Lấy giá trị TP của một lệnh bất kỳ                               |
//+------------------------------------------------------------------+

double GetOrderTakeProfit (int _Ticket) {
   double _OrderTakeProfit = NULL; 
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {
      _OrderTakeProfit = OrderTakeProfit();
     }
     return _OrderTakeProfit;
}