module myAccepter (clock, nextDigit, switch, reset, n11, n1, n0, accept);

    input clock, nextDigit, switch, reset;
    output n11, n1, n0, accept;
    // wire clock, nextDigit, switch, reset ;
    reg n11, n1, n0, accept;
    reg [2:0] nowState;
//    nowState = 3'b011;
    always @ (posedge clock | reset)
    begin
        case(reset)
            1'b0:
            begin
                case (switch)
                    1'b0:
                    begin
                        case (nowState)
                            //A STATE
                            3'b000:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //D
                                        nowState <= 3'b011;
                                        accept <= 1'b0;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b1;
                                    end

                                    1'b1:
                                    begin
                                        //B
                                        nowState <= 3'b001;
                                        accept <= 1'b0;
                                        n11 <= 1'b1;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end
                                endcase
                            end
                            //B STATE
                            3'b001:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //E
                                        nowState <= 3'b100;
                                        accept <= 1'b0;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end
                                    
                                    1'b1:
                                    begin
                                        //C
                                        nowState <= 3'b010;
                                        accept <= 1'b0;
                                        n11 <= 1'b0;
                                        n1 <= 1'b1;
                                        n0 <= 1'b0;
                                    end  
                                endcase        
                            end
                            //C STATE
                            3'b010:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //F
                                        nowState <= 3'b101;
                                        accept <= 1'b0;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end
                                    
                                    1'b1:
                                    begin
                                        //A
                                        nowState <= 3'b000;
                                        accept <= 1'b1;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end     
                                endcase   
                            end
                            //D STATE
                            3'b011:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //A
                                        nowState <= 3'b000;
                                        accept <= 1'b1;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end
                                    
                                    1'b1:
                                    begin
                                        //E
                                        nowState <= 3'b100;
                                        accept <= 1'b0;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end  
                                endcase    
                            end
                            //E STATE
                            3'b100:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //B
                                        nowState <= 3'b001;
                                        accept <= 1'b0;
                                        n11 <= 1'b1;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end
                                    
                                    1'b1:
                                    begin
                                        //F
                                        nowState <= 3'b101;
                                        accept <= 1'b0;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end 
                                endcase       
                            end
                            //F STATE
                            3'b101:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //C
                                        nowState <= 3'b010;
                                        accept <= 1'b0;
                                        n11 <= 1'b0;
                                        n1 <= 1'b1;
                                        n0 <= 1'b0;
                                    end
                                    
                                    1'b1:
                                    begin
                                        //D
                                        nowState <= 3'b011;
                                        accept <= 1'b0;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b1;
                                    end  
                                endcase      
                            end
                        endcase
                    end

                    1'b1:
                    begin
                        case (nowState)
                            //A STATE
                            3'b000:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //D
                                        nowState <= 3'b011;
                                        accept <= 1'b1;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b1;
                                    end

                                    1'b1:
                                    begin
                                        //B
                                        nowState <= 3'b001;
                                        accept <= 1'b1;
                                        n11 <= 1'b1;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end
                                endcase
                            end
                            //B STATE
                            3'b001:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //E
                                        nowState <= 3'b100;
                                        accept <= 1'b0;
                                        n11 <= 1'b1;
                                        n1 <= 1'b0;
                                        n0 <= 1'b1;
                                    end
                                    
                                    1'b1:
                                    begin
                                        //C
                                        nowState <= 3'b010;
                                        accept <= 1'b1;
                                        n11 <= 1'b0;
                                        n1 <= 1'b1;
                                        n0 <= 1'b0;
                                    end     
                                endcase     
                            end
                            //C STATE
                            3'b010:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //F
                                        nowState <= 3'b101;
                                        accept <= 1'b0;
                                        n11 <= 1'b0;
                                        n1 <= 1'b1;
                                        n0 <= 1'b1;
                                    end
                                    
                                    1'b1:
                                    begin
                                        //A
                                        nowState <= 3'b000;
                                        accept <= 1'b1;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end   
                                endcase     
                            end
                            //D STATE
                            3'b011:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //A
                                        nowState <= 3'b000;
                                        accept <= 1'b1;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end
                                    
                                    1'b1:
                                    begin
                                        //E
                                        nowState <= 3'b100;
                                        accept <= 1'b0;
                                        n11 <= 1'b1;
                                        n1 <= 1'b0;
                                        n0 <= 1'b1;
                                    end   
                                endcase   
                            end
                            //E STATE
                            3'b100:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //B
                                        nowState <= 3'b001;
                                        accept <= 1'b1;
                                        n11 <= 1'b1;
                                        n1 <= 1'b0;
                                        n0 <= 1'b0;
                                    end
                                    
                                    1'b1:
                                    begin
                                        //F
                                        nowState <= 3'b101;
                                        accept <= 1'b0;
                                        n11 <= 1'b0;
                                        n1 <= 1'b1;
                                        n0 <= 1'b1;
                                    end      
                                endcase  
                            end
                            //F STATE
                            3'b101:
                            begin
                                case (nextDigit)
                                    1'b0:
                                    begin
                                        //C
                                        nowState <= 3'b010;
                                        accept <= 1'b1;
                                        n11 <= 1'b0;
                                        n1 <= 1'b1;
                                        n0 <= 1'b0;
                                    end
                                    
                                    1'b1:
                                    begin
                                        //D
                                        nowState <= 3'b011;
                                        accept <= 1'b1;
                                        n11 <= 1'b0;
                                        n1 <= 1'b0;
                                        n0 <= 1'b1;
                                    end   
                                endcase     
                            end
                        endcase
                    end
                endcase
            end
            1'b1:
            begin
                case(switch)
                    1'b0:
                    begin
                        nowState <= 3'b011; 
                        accept <= 1'b0;
                        n11 <= 1'b0;
                        n1 <= 1'b0;
                        n0 <= 1'b1;
                    end
                    1'b1:
                    begin
                        nowState <= 3'b011; 
                        accept <= 1'b1;
                        n11 <= 1'b0;
                        n1 <= 1'b0;
                        n0 <= 1'b1;
                    end
                endcase
            end
        endcase
    end
endmodule








        // case (switch)
        //     1'b0  : case (switch)
        //                 1'b0  : ;
        //                 1'b1  : ;
        //             endcase;
        //     1'b1  : r_RESULT <= 1;
        // endcase