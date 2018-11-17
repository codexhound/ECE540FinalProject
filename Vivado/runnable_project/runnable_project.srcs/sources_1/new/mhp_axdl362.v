`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2018 03:30:46 PM
// Design Name: 
// Module Name: mhp_axdl362
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mhp_axdl362(
    input clk_50, clk_SPI, reset, MISO,
    output reg MOSI, n_CS,
    output reg [11:0] x_acc_reg, y_acc_reg, z_acc_reg,
    output reg [2:0] counter,
    output reg [2:0] readState
    );
    
    parameter
              //address defines
              X_L_REG = 8'h0E,
              X_H_REG = 8'h0F,
              Y_L_REG = 8'h10,
              Y_H_REG = 8'h11,
              Z_L_REG = 8'h12,
              Z_H_REG = 8'h13,
              //instruction defines
              REGISTER_READ = 8'b00001011,
              
              //readStates
              INSTRUCTION = 3'd0,
              ADDRESS = 3'd1,
              DATATRANSITION = 3'd2,
              DATA = 3'd3,
              SAVEDATA = 3'd4;
              
              
    reg [11:0] x_acc_reg_temp, y_acc_reg_temp, z_acc_reg_temp; //temp regs while reading
    reg done, roundDone;
    reg [7:0] address; //command for which register to read
    reg [7:0] accel_data; //save the incoming accel SPI data here
    //reg [2:0] counter; //SPI counter
    reg [7:0] instruction_reg;
    //reg [1:0] readState;
    
    always@(posedge clk_SPI) begin
        if(!reset) begin
            x_acc_reg_temp <= 0;
            y_acc_reg_temp <= 0;
            z_acc_reg_temp <= 0;
            n_CS <= 1;
            readState <= INSTRUCTION;
            instruction_reg <= REGISTER_READ;
            address <= X_L_REG;
            roundDone <= 0;
            counter <= 7; //counts down to 0
            done <= 1; //resets as done to start the next read
            MOSI <= 0;
            accel_data <= 0;
        end
        else begin
        	if(done) begin
        		done <= 0;
            	n_CS <= 0;
        	end
        	else begin
        	    if(readState == DATA) begin //posedge triggers, read data at posedges of clk when valid
        	       accel_data[counter] <= MISO;
        	   
        	       if(counter == 0) begin
        	           counter <= 7;
        	           readState <= SAVEDATA;
        	           n_CS <= 1; //done with read turn of CS
        	       end
        	       else counter <= counter - 1;
        	    end
        	    else if(readState == SAVEDATA) begin //save read data
        	        done <= 1; //ready to start next Read
        	        readState <= INSTRUCTION;
        	        //latch last data when done
        	        accel_data <= 0;
        	        case(address) //update read address once done reading one of them and data is saved
        	            X_L_REG : begin
        	                x_acc_reg_temp[7:0] <= accel_data;
        	                address <=  X_H_REG;
        	            end
        	            X_H_REG : begin
        	                x_acc_reg_temp[11:8] <= accel_data[3:0];
        	                address <=  Y_L_REG;
        	            end
        	            Y_L_REG : begin
        	                y_acc_reg_temp[7:0] <= accel_data;
        	                address <=  Y_H_REG;
        	            end
        	            Y_H_REG : begin
        	                y_acc_reg_temp[11:8] <= accel_data[3:0];
        	                address <=  Z_L_REG;
        	            end
        	            Z_L_REG : begin
        	                z_acc_reg_temp[7:0] <= accel_data;
        	                address <=  Z_H_REG;
        	            end
        	            Z_H_REG : begin
        	                z_acc_reg_temp[11:8] <= accel_data[3:0];
        	                roundDone <= 1;
        	                address <=  X_L_REG;
        	            end
        	            default : begin 
        	                address <= X_L_REG;
        	            end
        	        endcase
        	    end
        	end
        end
     end
     
     always@(negedge clk_SPI) begin //start negedge Logic (instruction and address bytes)
        if(!done) begin
            if(readState == INSTRUCTION || readState == ADDRESS) begin
                if(readState == INSTRUCTION) MOSI <= instruction_reg[counter];
                else MOSI <= address[counter];
                
                if(counter == 0) begin
                   counter <= 7;
                   if(readState == INSTRUCTION) readState <= ADDRESS;
                   else readState <= DATATRANSITION; //wait another neg edge before recieving data, data comes in starting in 2 clock edges
                end
                else counter <= counter - 1;
            end
            else if(readState == DATATRANSITION) readState <= DATA;
        end
     end
    
    always@(posedge clk_50) begin
        if(!reset) begin
            x_acc_reg <= 0;
            y_acc_reg <= 0;
            z_acc_reg <= 0;
        end
        else begin
            if(roundDone) begin //x,y,z have all been read and stored in temp regs, update accel regs (sync)
               roundDone <= 0;
               x_acc_reg <=  x_acc_reg_temp;
               y_acc_reg <=  y_acc_reg_temp;
               z_acc_reg <=  z_acc_reg_temp;
            end
        end
    end
    
endmodule
