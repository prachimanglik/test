// 400Khz Clock
  if (counter_clk < 29'd31)
    clock = 0;
else if ((counter_clk >= 29'd31) && (counter_clk <29'd62))
    clock = 1;
    
       counter_clk = counter_clk + 1;
   
   if(counter_clk == 29'd62)
   counter_clk = 0;
 end 
 
 
