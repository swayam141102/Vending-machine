module vmachine(in,clk,rst,out,change);
  input clk,rst;
  input [1:0] in;
  output reg out;
  output reg [1:0] change;
  parameter s0=2'b00;
  parameter s1=2'b01;
  parameter s2=2'b10;
  reg [1:0] ps,ns;
  always @( posedge clk)
    begin
      if(rst)
        begin
          ps<=s0;
          change<=2'b00;
        end
      else
        ps<=ns;
    end
  always @(ps,in)
    begin
      case(ps)
        s0:begin
          if(in==0)
            begin
              ns=s0;
              out=0;
              change=2'b00;
            end
          else if(in==2'b01)
            begin
              ns=s1;
              out=0;
              change=2'b00;
            end
          else if(in==2'b10)
            begin
              ns=s2;
              out=0;
              change=2'b00;
            end
        end
        s1:begin
          if(in==0)
            begin
              ns=s0;
              out=0;
              change=2'b01;
            end
          else if(in==2'b01)
            begin
              ns=s2;
              out=0;
              change=2'b00;
            end
          else if(in==2'b10)
            begin
              ns=s0;
              out=1;
              change=2'b00;
            end
        end
        
       s2:begin
          if(in==0)
            begin
              ns=s0;
              out=0;
              change=2'b10;
            end
          else if(in==2'b01)
            begin
              ns=s0;
              out=1;
              change=2'b00;
            end
          else if(in==2'b10)
            begin
              ns=s0;
              out=1;
              change=2'b01;
            end
        end
        endcase
    end
endmodule
        
