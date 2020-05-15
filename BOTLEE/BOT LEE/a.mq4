//+------------------------------------------------------------------+
//|                                                  objcreatbuy.mq4 |
//|                                                              SOn |
//|                                              https://g-saram.com |
//+------------------------------------------------------------------+
#property copyright "SOn"
#property link      "https://g-saram.com"
#property version   "1.00"
#property indicator_levelcolor clrRed
#property script_show_inputs
#include "TicketOrderSymbol.mqh"
#include "ordersend.mqh"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
input string Key = NULL;
input string Name_Obj = "Text";
input int periodForRSI = 14;
input double lots = 0.01;

bool Text_Creat ( const long _char_ID = 0,  // ChartID 
                 const string _name = "Obj_1", // Tao ten cuar doi tuong
                 const int _sub_window = 0, // index cai nay chua hieu nhng phai co
                 datetime _time = 0, // Chắc lấy thời điểm hiện tịa
                 double _price = 0,
                 const string _text = "Text",
                 const string _font = "Arial",
                 const int _font_size = 10,
                 const color _clr = clrRed,
                 const double _goc_quay = 0.0,
                 const ENUM_ANCHOR_POINT _anchor = ANCHOR_LEFT_UPPER, // KIEU ANCHOR LA GI KHONG HIEU
                 const bool _back = false,
                 const bool _lua_chon = false,
                 const bool _hidden = true,
                 const long _z_order = 0 
)
 {
 
   ObjectCreate(_char_ID,_name,OBJ_TEXT,0,TimeCurrent(),Bid);
   ResetLastError(); // thông báo laooix
   ObjectSetString(_char_ID, _name, OBJPROP_TEXT, _text); // cai dat ten cho 
   ObjectSetString(_char_ID,_name, OBJPROP_FONT, _font); // cai dat font chu
   ObjectSetInteger(_char_ID,_name, OBJPROP_FONTSIZE, _font_size); // cai dat font size
   ObjectSetInteger(_char_ID,_name,OBJPROP_COLOR, _clr); // cai dat mau
   ObjectSetDouble(_char_ID,_name,OBJPROP_ANGLE,_goc_quay); // cai dat doc quay cho doi tuong
   ObjectSetInteger(_char_ID,_name,OBJPROP_ANCHOR,_anchor); // cai diem  nay khong hieu cho lam
   ObjectSetInteger(_char_ID,_name,OBJPROP_BACK,_back); // cai nay khoing biet
   ObjectSetInteger(_char_ID,_name,OBJPROP_SELECTABLE,_lua_chon);  // --- enable (true) hoặc vô hiệu hóa (false) chế độ di chuyển đối tượng bằng chuột
   ObjectSetInteger(_char_ID,_name,OBJPROP_SELECTED,_lua_chon); // --- ẩn (true) hoặc hiển thị (false) tên đối tượng đồ họa trong danh sách đối tượng
   ObjectSetInteger(_char_ID,_name,OBJPROP_HIDDEN,_hidden); // //--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(_char_ID,_name,OBJPROP_ZORDER,_z_order); // Z order cai nay la de hoa nthan vien chap hanh lenh
   return(true);
   
 }
 
bool Text_Create ( const long _chartID = 0,
                   const string _name = "Obj_2",
                   const string _content = "Noi dung",
                   const string _font = "Time New Roman",
                   const int _sub_window = 0,
                   const int _font_size = 13,
                   const color _color = clrAntiqueWhite,
               //    const color _color_bg = clrBlack,
               //    const color _color_border = clrDarkGreen,
               //    const ENUM_BASE_CORNER _border_type = CORNER_LEFT_UPPER,
                   const int _x_distance_ok = NULL,
                   const int _y_distance_ok = NULL,
                   datetime _time = 0,
                   double _price = 0
                  ) {   
     int _x_distance, _y_distance;                                
     int _x = (int)_x_distance_ok;
     int _y = (int)_y_distance_ok;
     ChangeTextEmptyPoint(_time,_price); 
     ChartTimePriceToXY(_chartID,0,TimeCurrent(),Open[0],_x_distance,_y_distance); // get coordinates
     ObjectCreate(_chartID,_name,OBJ_TEXT,0,TimeCurrent(),Bid);
     ObjectSetString(_chartID,_name,OBJPROP_TEXT,_content);
     ObjectSetString(_chartID,_name,OBJPROP_FONT,_font);
     ObjectSetInteger(_chartID,_name,OBJPROP_COLOR,clrAntiqueWhite);
     ObjectSetInteger(_chartID,_name,OBJPROP_FONTSIZE,_font_size);
    // ObjectSetInteger(_chartID,_name,OBJPROP_BGCOLOR,_color_bg);
    // ObjectSetInteger(_chartID,_name,OBJPROP_BORDER_COLOR,_color_border);
    // ObjectSetInteger(_chartID,_name,OBJPROP_ANCHOR,_border_type);
     ObjectSetInteger(_chartID,_name,OBJPROP_XDISTANCE,_x_distance_ok);
     ObjectSetInteger(_chartID,_name,OBJPROP_YDISTANCE,_y_distance_ok);
     
     
     
     
return(true);
}

bool TextCreate (const long _chartID = 0,
                 const string _nameObj = "ObjRSI",
                 const string _content = "Noi dung",
                 const string _font = "Arial",
                 const int _sub_window = 0,
                 const int _fon_size = 13,
                 const color _color = clrAntiqueWhite,
                 const int _x_distance = NULL,
                 const int _y_distance = NULL
               
   )
 {
   
   return(true);
 }


bool Text_Move ( const long _chartID = 0,
                 const string _name = "Obj_2",
                 datetime _time = 0,
                 double _price = 0)
                 
 {
   if(!_time)
     {
     _time = TimeCurrent();
     }
   if(!_price)
     {
      _price = SymbolInfoDouble(Symbol(),SYMBOL_BID);
     }
   ObjectMove(_name,OBJPROP_TEXT,_time,_price);
   return(true);
 }
 
 void ChangeTextEmptyPoint(datetime &time,double &price)
  {
//--- if the point's time is not set, it will be on the current bar
   if(!time)
      time=TimeCurrent();
//--- if the point's price is not set, it will have Bid value
   if(!price)
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
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
//--- khai bao bien
   string MAIN_KEY = "123";
   int duong_RSI = NULL;
   int ngang, doc;
   int a = (int)ngang;
   int b = (int)doc;
    datetime time =  TimeCurrent();
    int Ticket = NULL;
    string time_str = TimeToStr(TimeCurrent(),TIME_DATE|TIME_SECONDS); // hConvert Kieu du lieu tu datetime sang string
    string SIN = "Hello moi nguoi toi la SOn";
    int Singal = NULL;
   
//+---------------------------------------------------

//|  khai bao key cua chuong trinh
//+------------------------------------------------------------------+


//---

if(Key != MAIN_KEY)
  {
   ExpertRemove();
  }
//--- khai bao cho viec convert
  
  //--- xu ly tin hieu 
  duong_RSI = NormalizeDouble(iRSI(Symbol(),PERIOD_CURRENT,periodForRSI,PRICE_CLOSE,0),5);
   
   if(duong_RSI >= 25 && duong_RSI <= 35)
     {
      Singal = 1;
     }
 
   if(duong_RSI >= 65 && duong_RSI <= 75)
     {
      Singal = 2;
     }
  //--- 
  if(duong_RSI >= 35 && duong_RSI <= 65)
    {
     Singal = 0;
    }
  switch(Singal)
    {
    case 0:
       Comment("Không vao lenh");
       break;
     case  1:
       Comment("Singal BUY");
       
       OrderSell(lots,"Vao lenh Sell",NULL,NULL,144);
       break;
     case 2:
        Comment("Singal SELL");
        break;
    
     default:
       break;
    }
    
    if(duong_RSI == 30 )
      {
       
      }
    
    
    Comment(MagicNumber() + " -= "+  Count_MagicNumber() + " - " + duong_RSI);   
    
    
 }
  

//--- Dem So luuog nmagic number 


  
//+------------------------------------------------------------------+
// TicketOrder
int Count_MagicNumber() {
   int _result = NULL;
   int _total = OrdersTotal();
   if(MagicNumber() == 0)
     {
      Alert("Cap tien nay khong co tron CSDL");
     }
   for(int _i=0; _i< _total; _i++)
     {
      if(OrderSelect(_i,SELECT_BY_POS,MODE_TRADES))
        {
         if(OrderMagicNumber() == MagicNumber())
           {
            _result++;
           }
        }
     }
     return _result;
}

double Get_Order_Open_Price ( int _Ticket) {
   double _Order_Open_Price = NULL;
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES))
     {   
         _Order_Open_Price = OrderOpenPrice();
     }
     return _Order_Open_Price;
}

datetime Get_Order_Open_Time (int _Ticket) {
   datetime _Time = NULL; 
   if(OrderSelect(_Ticket,SELECT_BY_TICKET,MODE_TRADES) )
     {
      _Time = OrderOpenTime();
     }
    return _Time;
   }
//--- Lenh Buy
   
int OrderBuy (double _lots, string _comment, double _stoploss, double _takeprofit, int _magic_number ) {
int _result = NULL;
     _result = OrderSend(Symbol(),OP_BUY,_lots,Ask,3,_stoploss,_takeprofit,_comment, _magic_number,0,Green);
     
return _result;
}

//--- Lenh Sell

 
int OrderSell (double _lots, string _commernt, double _stoploss, double _takeprofit, int _magic_number) {
   int _result = NULL;
   _result = OrderSend(Symbol(),OP_SELL,_lots, Bid, 3, _stoploss, _takeprofit, _commernt, _magic_number, 0, Blue);
   return _result;
}


