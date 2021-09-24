module sevenseg(clk,reset,an,cath,dp);
output cath;
reg [6:0]cath;
output dp;
input clk;
input reset;
output [3:0]an;
reg [3:0]an;
reg [3:0]first; //register for the first digit
reg [3:0]second; //register for the second digit
reg [7:0]inputvar;
always @ (posedge clk)
 begin
  if (reset)
   begin
   first <= 0;
   second <= 0;
   end
   else if (first==4'd9) 
    begin  //9 reached
    first <= 0;
     if (second == 4'd9) //99 reached
      second <= 0;
     else
       second <= second + 1;
    end
   else
    first <= first + 1;
  end
 

always @ (*)
 begin
   if(first<=4'd9)
     begin
     an=4'b1110;
     inputvar= first;
   end
   else
     begin
     an=4'b1100;
     inputvar={second,first};
end   
   end
  /*case({second,first})
    
   2'b00 :
    begin
     inputvar = first;
     an = 4'b1110;
    end
    
   2'b01:
    begin
     inputvar = second;
     an = 4'b1101;
    end
 default:an=4'b1111;   
  endcase*/


 


always @ (*)
 begin
  case(inputvar)
   4'd0 : cath = 7'b1000000; //0
   4'd1 : cath = 7'b1111001; //1
   4'd2 : cath = 7'b0100100; //2
   4'd3 : cath = 7'b0110000; //3
   4'd4 : cath = 7'b0011001; //4
   4'd5 : cath = 7'b0010010; //5
   4'd6 : cath = 7'b0000010; //6
   4'd7 : cath = 7'b1111000; //7
   4'd8 : cath = 7'b0000000; //8
   4'd9 : cath = 7'b0010000; //9
   default : cath = 7'b1111111;
  endcase
 end
assign dp=1'b1;///bcoz we dont need decimal point
endmodule

