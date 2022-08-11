module CA_1(clock,reset,CA_out);
    input clock,reset; 
    output reg [24:1]CA_out; 
    
    reg ctemp24,ctemp23,ctemp22,ctemp21,ctemp20,ctemp19,ctemp18,ctemp17,ctemp16,ctemp15,ctemp14,ctemp13,ctemp12,ctemp11,ctemp10,ctemp9,ctemp8,ctemp7,ctemp6,ctemp5,ctemp4,ctemp3,ctemp2,ctemp1,ctemp0;
    reg [24:1]seed=24'b100110011011001110101011; 
    reg [24:1]caxor; 
    integer flag=0;
    integer total_count=0;
    
    always@(posedge(clock) or negedge(reset))
    begin
        if(!reset)
           begin 
        caxor<=seed;
        total_count <= 0;
        flag <= 0;
           end
        else 
           begin 
              if(total_count<=1048575)
                 begin
                     if (flag==0)
                       begin
                           ctemp24<=1'b0^caxor[24]^caxor[23];
                               ctemp23<=caxor[24]^caxor[23]^caxor[22];
                               ctemp22<=caxor[23]^caxor[21];
                               ctemp21<=caxor[22]^caxor[21]^caxor[20];
                               ctemp20<=caxor[21]^caxor[19];
                               ctemp19<=caxor[20]^caxor[19]^caxor[18];
                               ctemp18<=caxor[19]^caxor[17];
                               ctemp17<=caxor[18]^caxor[17]^caxor[16];
                               ctemp16<=caxor[17]^caxor[15];
                               ctemp15<=caxor[16]^caxor[15]^caxor[14];
                               ctemp14<=caxor[15]^caxor[13];
                               ctemp13<=caxor[14]^caxor[13]^caxor[12];
                               ctemp12<=caxor[13]^caxor[11];
                               ctemp11<=caxor[12]^caxor[11]^caxor[10];
                               ctemp10<=caxor[11]^caxor[9];
                               ctemp9<=caxor[10]^caxor[9]^caxor[8];
                               ctemp8<=caxor[9]^caxor[7];
                               ctemp7<=caxor[8]^caxor[7]^caxor[6];
                               ctemp6<=caxor[7]^caxor[5];
                               ctemp5<=caxor[6]^caxor[5]^caxor[4];
                               ctemp4<=caxor[5]^caxor[3];
                               ctemp3<=caxor[4]^caxor[3]^caxor[2];
                               ctemp2<=caxor[3]^caxor[1];
                               ctemp1<=caxor[2]^caxor[1]^1'b0;
                               flag<=1;
                       end
                     else if (flag==1)
                         begin
                             caxor<={ctemp24,ctemp23,ctemp22,ctemp21,ctemp20,ctemp19,ctemp18,ctemp17,ctemp16,ctemp15,ctemp14,ctemp13,ctemp12,ctemp11,ctemp10,ctemp9,ctemp8,ctemp7,ctemp6,ctemp5,ctemp4,ctemp3,ctemp2,ctemp1};
                             CA_out<=caxor;
                             total_count <= total_count + 1;
                             flag <= 0;
                         end
                 end
           end
    end
endmodule
                     
        


