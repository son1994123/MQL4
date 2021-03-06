//+------------------------------------------------------------------+
//|                                                       button.mq4 |
//|                                           Son nguyen Development |
//|                                          https://webdanang43.net |
//+------------------------------------------------------------------+
#property copyright "Son nguyen Development"
#property link      "https://webdanang43.net"
#property version   "1.00"
// strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
input int MaxSlippage = 5;
input string Comment_demo = "Vi du 123";
int OnInit()
  {
//---
   ObjectCreate(0,"CloseButton",OBJ_BUTTON,0,0,0); // cái này để tạo button
   ObjectSetInteger(0,"CloseButton",OBJPROP_XDISTANCE,205); // khoảng cách từ bên trái cho đến đối tượng
   ObjectSetInteger(0,"CloseButton",OBJPROP_YDISTANCE,10);  // khoảng cách từ bên trên đnế đối tượng
   ObjectSetInteger(0,"CloseButton",OBJPROP_XSIZE,500); // chiều dài đối tượng
   ObjectSetInteger(0,"CloseButton",OBJPROP_YSIZE,50); // chiều cao đối tượng

   ObjectSetString(0,"CloseButton",OBJPROP_TEXT,Comment_demo); // Nội dung ở trong
      
  
   ObjectSetInteger(0,"CloseButton",OBJPROP_COLOR, Blue);
   ObjectSetInteger(0,"CloseButton",OBJPROP_BGCOLOR, Red);
   ObjectSetInteger(0,"CloseButton",OBJPROP_BORDER_COLOR,Red);
   ObjectSetInteger(0,"CloseButton",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0,"CloseButton",OBJPROP_BACK,false);
   ObjectSetInteger(0,"CloseButton",OBJPROP_HIDDEN,true);
   ObjectSetInteger(0,"CloseButton",OBJPROP_STATE,false);
   ObjectSetInteger(0,"CloseButton",OBJPROP_FONTSIZE,22);

//---
 ObjectCreate(0,"Order",OBJ_BUTTON,0,0,0); // cái này để tạo button
   ObjectSetInteger(0,"Order",OBJPROP_XDISTANCE,20); // khoảng cách từ bên trái cho đến đối tượng
   ObjectSetInteger(0,"Order",OBJPROP_YDISTANCE,100);  // khoảng cách từ bên trên đnế đối tượng
   ObjectSetInteger(0,"Order",OBJPROP_XSIZE,500); // chiều dài đối tượng
   ObjectSetInteger(0,"Order",OBJPROP_YSIZE,50); // chiều cao đối tượng

   ObjectSetString(0,"Order",OBJPROP_TEXT,"Bam nut nay");
      
  
   ObjectSetInteger(0,"Order",OBJPROP_COLOR, clrYellow);
   ObjectSetInteger(0,"Order",OBJPROP_BGCOLOR, Red);
   ObjectSetInteger(0,"Order",OBJPROP_BORDER_COLOR,Red);
   ObjectSetInteger(0,"Order",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0,"Order",OBJPROP_BACK,false);
   ObjectSetInteger(0,"Order",OBJPROP_HIDDEN,true);
   ObjectSetInteger(0,"Order",OBJPROP_STATE,false);
   ObjectSetInteger(0,"Order",OBJPROP_FONTSIZE,22);

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   ObjectDelete(0,"CloseButton");
  // ObjectDelete(0,"Order");
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)  // Sự kiện diễn ra trên chart
   {
    if(sparam == "CloseButton")
     {
      CloseAllOpenPositions(MaxSlippage);
      ObjectSetInteger(0,"CloseButton",OBJPROP_STATE,false);    

     }
    if(sparam == "Order")
      {
       BUY(0.01);
      } 
   
   }
void OnTick()
  {
//---
  
  }
//+------------------------------------------------------------------+
void CloseAllOpenPositions(int intMaxSlippage)
  {
   Comment("Hello");
  
  
  }
  
void Demo() {
   Comment("Bam nut");
}

int BUY (double _lots) {
   int result = NULL;
   result = OrderSend(Symbol(),OP_BUY,_lots,Ask,5,NULL,NULL,"Bam Nut",144,NULL,Green);
   return result;
}