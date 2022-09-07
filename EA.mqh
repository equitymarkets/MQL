int i;

double pips;

bool CheckOpenOrders()
  { 
   for(i = 0 ; i < OrdersTotal() ; i++ ) 
     { 
      bool check = OrderSelect(i,SELECT_BY_POS, MODE_TRADES); 
      if (OrderSymbol() == Symbol()) return(true); 
     } 
      return(false); 
  }

void OrderHistory()
  {
   for(i = 0; i < OrdersHistoryTotal(); i++)
     {
      bool checker = OrderSelect(i,SELECT_BY_POS,MODE_HISTORY);
        {
         Alert( "Order ", i, " time was ",  OrderCloseTime() - OrderOpenTime());
        }
     }
  }
  
double ATV_0(short atr_timeframe, short obv_timeframe, short atr_period)
  {
   double ATR_0 = iATR(Symbol(),atr_timeframe,atr_period,0);
   double OBV_0 = iOBV(Symbol(),obv_timeframe,PRICE_CLOSE,0); 
   return(ATR_0 * OBV_0);
  } 

int Entropy(int minutes)
  {
   int time_addition = rand()%(minutes * 60);
   return(time_addition);
  }

bool IsNewCandle()
  {
   static datetime saved_candle_time;
   if(Time[0] == saved_candle_time)
     {
      return(false);
     }
   else
      saved_candle_time = Time[0];
   return(true);
  }     
//---  
/*bool Legacy(bool weekend, int other_time)  
  {
   if(weekend)
     {
      if(iTime(Symbol(),timeframe,0) - iTime(Symbol(),timeframe,1) > 25200) 
        {
         return(false);
        }
     }
   if(iTime(Symbol(),timeframe,0) - iTime(Symbol(),timeframe,1) > other_time)
     {
      return(false);
     } 
   return(true);
  } */ 
//--- 



