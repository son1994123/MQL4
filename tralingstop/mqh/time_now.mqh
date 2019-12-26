//+------------------------------------------------------------------+
//|                                                     time_now.mqh |
//|                                           Son Nguyen Development |
//|                                         https://webdanang43.net/ |
//+------------------------------------------------------------------+
#property copyright "Son Nguyen Development"
#property link      "https://webdanang43.net/"
#property strict
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+
datetime Time_now ()  {
   datetime Time_Now;
   string _day = IntegerToString(TimeDay(TimeCurrent()));
   string _month = IntegerToString(TimeMonth(TimeCurrent()));
   string _year = IntegerToString(TimeYear(TimeCurrent()));
   string _hour = IntegerToString(TimeHour(TimeCurrent()));
   string _minute = IntegerToString(TimeMinute(TimeCurrent()));
   string _second = IntegerToString(TimeSeconds(TimeCurrent())); 
   string Time_demos = _year+"."+_month+"."+_day+" "+_hour+":"+_minute+":"+_second;
    Time_Now = StringToTime(Time_demos);
   return Time_Now;
}