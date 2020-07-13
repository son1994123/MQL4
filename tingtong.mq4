//+------------------------------------------------------------------+
//|                                                     tingtong.mq4 |
//|                                           Son Nguyen Development |
//|                                             https://g-saram.com/ |
//+------------------------------------------------------------------+
#property copyright "Son Nguyen Development"
#property link      "https://g-saram.com/"
#property version   "1.00"
input int Period_for_RSI = 14;
input int SecondStop = 10;
enum m1trueorfalse
  {
   m1true = 1,
   m1false = 0
  };
input m1trueorfalse luachonde;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
void draw_button (string _name, int _manhinh, int _xdistane, int _ydistane, int _xsize, int _ysize, string _text, color _color) {
string button_name = _name;
ObjectCreate(0,button_name,OBJ_BUTTON,_manhinh,0,0);
ObjectSetInteger(0,button_name,OBJPROP_XDISTANCE,_xdistane);
ObjectSetInteger(0,button_name,OBJPROP_YDISTANCE,_ydistane);
ObjectSetInteger(0,button_name,OBJPROP_XSIZE,_xsize);
ObjectSetInteger(0,button_name,OBJPROP_YSIZE,_ysize);
ObjectSetInteger(0,button_name,OBJPROP_FONTSIZE,12);
ObjectSetString(0,button_name,OBJPROP_FONT,"Times New Roman");
ObjectSetString(0,button_name,OBJPROP_TEXT,_text);
ObjectSetInteger(0,button_name,OBJPROP_COLOR,_color);
ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,clrLime);
 ObjectSetInteger(0,button_name,OBJPROP_STATE,false);
}

void StopBot (int _second) {
   int _secondStop = _second * 1000;
   Sleep(_secondStop);

}
int OnInit()
  {
//---
   string name1 = "stopbot";
   draw_button(name1,0,10,40,100,30,"Stop BOT",Red);
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
   string Alert_ForSymbol[10];
   int RSI_1M = int(iRSI(Symbol(),PERIOD_M1,Period_for_RSI,PRICE_CLOSE,0));
   int RSI_5M = int(iRSI(Symbol(),PERIOD_M5,Period_for_RSI,PRICE_CLOSE,0));
   int RSI_15M = int(iRSI(Symbol(),PERIOD_M15,Period_for_RSI,PRICE_CLOSE,0)); 
   int RSI_30M = int(iRSI(Symbol(),PERIOD_M30,Period_for_RSI,PRICE_CLOSE,0));
   int RSI_H1 = int(iRSI(Symbol(),PERIOD_H1,Period_for_RSI,PRICE_CLOSE,0));
   int RSI_H4 = int(iRSI(Symbol(),PERIOD_H4,Period_for_RSI,PRICE_CLOSE,0));
   int RSI_D1 = int(iRSI(Symbol(),PERIOD_D1,Period_for_RSI,PRICE_CLOSE,0));
   int RSI_W1 = int(iRSI(Symbol(),PERIOD_W1,Period_for_RSI,PRICE_CLOSE,0));
   int RSI_MN = int(iRSI(Symbol(),PERIOD_MN1,Period_for_RSI,PRICE_CLOSE,0));
   
 if( luachonde == 1)
   {
      if(RSI_1M == 30 || RSI_1M == 70)
     {
      PlaySound("Audio.wav");
      Alert_ForSymbol[0] = "RSI Chart M1 " + Symbol();
      Alert( Alert_ForSymbol[0]);      
      Sleep(10000);
     }
   }
   
   if(RSI_5M == 30 || RSI_5M == 70)
     {
      PlaySound("Audio.wav");
      Alert_ForSymbol[1] = "RSI Chart M5 " + Symbol();
      Alert( Alert_ForSymbol[1]);      
       Sleep(10000);
     }
   if(RSI_15M == 30 || RSI_15M == 70)
     {
      PlaySound("Audio.wav");
      Alert_ForSymbol[2] = "RSI Chart M15 " + Symbol();
      Alert( Alert_ForSymbol[2]);      
       Sleep(3000);
     }
   if(RSI_30M == 30 || RSI_30M == 70)
     {
      PlaySound("Audio.wav");
      Alert_ForSymbol[3] = "RSI Chart M30 " + Symbol();
      Alert( Alert_ForSymbol[3]);            
       Sleep(3000);
     }
   if(RSI_H1 == 30 || RSI_H1 == 70)
     {
      PlaySound("Audio.wav");
      Alert_ForSymbol[4] = "RSI Chart H1 " + Symbol();
      Alert( Alert_ForSymbol[4]);      
       Sleep(3000);
     }
   if(RSI_H4 == 30 || RSI_H4 == 70)
     {
       PlaySound("Audio.wav");
      Alert_ForSymbol[5] = "RSI Chart H4 " + Symbol();
      Alert( Alert_ForSymbol[5]);      
        Sleep(3000);
     }
    if(RSI_D1 == 30 || RSI_D1 == 70)
     {
       PlaySound("Audio.wav");
      Alert_ForSymbol[6] = "RSI Chart D1 " + Symbol();
      Alert( Alert_ForSymbol[6]);      
        Sleep(3000);
     }  
    if(RSI_W1 == 30 || RSI_W1 == 70)
      {
       PlaySound("Audio.wav");
      Alert_ForSymbol[7] = "RSI Chart W1 " + Symbol();
      Alert( Alert_ForSymbol[7]);      
        Sleep(3000);
      }
    if(RSI_MN == 30 || RSI_MN == 70)
      {
       PlaySound("Audio.wav");
      Alert_ForSymbol[8] = "RSI Chart MN " + Symbol();
      Alert( Alert_ForSymbol[8]);      
        Sleep(3000);
      }  
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   if(sparam == "stopbot")
     {
      StopBot(SecondStop);
      ObjectSetInteger(0,"stopbot",OBJPROP_STATE,false);
      
     }
  }
//+------------------------------------------------------------------+
