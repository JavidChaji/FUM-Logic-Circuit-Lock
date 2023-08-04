module myAccepter (clock, nextDigit, switch, reset, n11, n1, n0, accept);

    input clock, nextDigit, switch, reset;
    output n11, n1, n0, accept;
    // wire clock, nextDigit, switch, reset ;
    reg n11, n1, n0, accept;
    reg [2:0] nowState;
    initial 
    begin
        nowState <= 3'b000;
        accept <= 0;
    end
//   nowState = 3'b011;

    always @ (posedge reset)
    begin
        if(switch == 1'b0)
        begin
            nowState <= 3'b011; 
            accept <= 1'b0;
            n11 <= 1'b0;
            n1 <= 1'b0;
            n0 <= 1'b1;
        end
        else
        begin
            nowState <= 3'b011; 
            accept <= 1'b1;
            n11 <= 1'b0;
            n1 <= 1'b0;
            n0 <= 1'b1;
        end
    end
    always @ (posedge clock)
    begin
        if (switch == 1'b0)
        begin
            //A STATE
            if(nowState == 3'b000)
            begin
                if (nextDigit == 1'b0)
                begin
                    //D
                    nowState <= 3'b011;
                    accept <= 1'b0;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b1;
                end

                if (nextDigit == 1'b1)
                begin
                    //B
                    nowState <= 3'b001;
                    accept <= 1'b0;
                    n11 <= 1'b1;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end
            end
            //B STATE
            if(nowState == 3'b001)
            begin
                if (nextDigit == 1'b0)
                begin
                    //E
                    nowState <= 3'b100;
                    accept <= 1'b0;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end
                
                if (nextDigit == 1'b1)
                begin
                    //C
                    nowState <= 3'b010;
                    accept <= 1'b0;
                    n11 <= 1'b0;
                    n1 <= 1'b1;
                    n0 <= 1'b0;
                end          
            end
            //C STATE
            if(nowState == 3'b010)
            begin
                if (nextDigit == 1'b0)
                begin
                    //F
                    nowState <= 3'b101;
                    accept <= 1'b0;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end
                
                if (nextDigit == 1'b1)
                begin
                    //A
                    nowState <= 3'b000;
                    accept <= 1'b1;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end        
            end
            //D STATE
            if(nowState == 3'b011)
            begin
                if (nextDigit == 1'b0)
                begin
                    //A
                    nowState <= 3'b000;
                    accept <= 1'b1;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end
                
                if (nextDigit == 1'b1)
                begin
                    //E
                    nowState <= 3'b100;
                    accept <= 1'b0;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end      
            end
            //E STATE
            if(nowState == 3'b100)
            begin
                if (nextDigit == 1'b0)
                begin
                    //B
                    nowState <= 3'b001;
                    accept <= 1'b0;
                    n11 <= 1'b1;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end
                
                if (nextDigit == 1'b1)
                begin
                    //F
                    nowState <= 3'b101;
                    accept <= 1'b0;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end        
            end
            //F STATE
            if(nowState == 3'b101)
            begin
                if (nextDigit == 1'b0)
                begin
                    //C
                    nowState <= 3'b010;
                    accept <= 1'b0;
                    n11 <= 1'b0;
                    n1 <= 1'b1;
                    n0 <= 1'b0;
                end
                
                if (nextDigit == 1'b1)
                begin
                    //D
                    nowState <= 3'b011;
                    accept <= 1'b0;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b1;
                end        
            end
        end

        if (switch == 1'b1)
        begin
            //A STATE
            if(nowState == 3'b000)
            begin
                if (nextDigit == 1'b0)
                begin
                    //D
                    nowState <= 3'b011;
                    accept <= 1'b1;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b1;
                end

                if (nextDigit == 1'b1)
                begin
                    //B
                    nowState <= 3'b001;
                    accept <= 1'b1;
                    n11 <= 1'b1;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end
            end
            //B STATE
            if(nowState == 3'b001)
            begin
                if (nextDigit == 1'b0)
                begin
                    //E
                    nowState <= 3'b100;
                    accept <= 1'b0;
                    n11 <= 1'b1;
                    n1 <= 1'b0;
                    n0 <= 1'b1;
                end
                
                if (nextDigit == 1'b1)
                begin
                    //C
                    nowState <= 3'b010;
                    accept <= 1'b1;
                    n11 <= 1'b0;
                    n1 <= 1'b1;
                    n0 <= 1'b0;
                end          
            end
            //C STATE
            if(nowState == 3'b010)
            begin
                if (nextDigit == 1'b0)
                begin
                    //F
                    nowState <= 3'b101;
                    accept <= 1'b0;
                    n11 <= 1'b0;
                    n1 <= 1'b1;
                    n0 <= 1'b1;
                end
                
                if (nextDigit == 1'b1)
                begin
                    //A
                    nowState <= 3'b000;
                    accept <= 1'b1;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end        
            end
            //D STATE
            if(nowState == 3'b011)
            begin
                if (nextDigit == 1'b0)
                begin
                    //A
                    nowState <= 3'b000;
                    accept <= 1'b1;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end
                
                if (nextDigit == 1'b1)
                begin
                    //E
                    nowState <= 3'b100;
                    accept <= 1'b0;
                    n11 <= 1'b1;
                    n1 <= 1'b0;
                    n0 <= 1'b1;
                end      
            end
            //E STATE
            if(nowState == 3'b100)
            begin
                if (nextDigit == 1'b0)
                begin
                    //B
                    nowState <= 3'b001;
                    accept <= 1'b1;
                    n11 <= 1'b1;
                    n1 <= 1'b0;
                    n0 <= 1'b0;
                end
                
                if (nextDigit == 1'b1)
                begin
                    //F
                    nowState <= 3'b101;
                    accept <= 1'b0;
                    n11 <= 1'b0;
                    n1 <= 1'b1;
                    n0 <= 1'b1;
                end        
            end
            //F STATE
            if(nowState == 3'b101)
            begin
                if (nextDigit == 1'b0)
                begin
                    //C
                    nowState <= 3'b010;
                    accept <= 1'b1;
                    n11 <= 1'b0;
                    n1 <= 1'b1;
                    n0 <= 1'b0;
                end
                
                if (nextDigit == 1'b1)
                begin
                    //D
                    nowState <= 3'b011;
                    accept <= 1'b1;
                    n11 <= 1'b0;
                    n1 <= 1'b0;
                    n0 <= 1'b1;
                end        
            end
        end
    end

        begin

        end
    end
endmodule








        // case (switch)
        //     1'b0  : case (switch)
        //                 1'b0  : ;
        //                 1'b1  : ;
        //             endcase;
        //     1'b1  : r_RESULT <= 1;
        // endcase