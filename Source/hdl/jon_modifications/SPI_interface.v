`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2018 03:30:46 PM
// Design Name: 
// Module Name: spi_interface
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


module spi_interface(
    input clk_SPI, reset, MISO,
    output reg MOSI, n_CS, roundDD,
    output reg [11:0] x_acc_reg_temp, y_acc_reg_temp, z_acc_reg_temp,
    output reg [2:0] counter, 
    output reg [2:0] SPI_state
    );
    
    parameter
              //address defines
              CON_REG = 8'h2D,
              X_L_REG = 8'h0E,
              X_H_REG = 8'h0F,
              Y_L_REG = 8'h10,
              Y_H_REG = 8'h11,
              Z_L_REG = 8'h12,
              Z_H_REG = 8'h13,
              //instruction defines
              REGISTER_READ = 8'h0B,
              REGISTER_WRITE = 8'h0A,
              
              //SPI States
              BEGIN = 3'd0,
              INSTRUCTION = 3'd1,
              ADDRESS = 3'd2,
              //DATATRANSITION = 4'd3,
              DATAIN = 3'd3,
              DATAOUT = 3'd4,
              END = 3'd5,
              END1 = 3'd6,
              BEGIN1 = 3'd7,
              //read/write
              WRITE = 1'b1,
              READ = 1'b0;
              
        
    reg rw, roundDone;
    reg [7:0] address; //command for which register to read
    reg [7:0] accel_data; //save the incoming accel SPI data here
    //reg [2:0] counter, SPI_state; //SPI counter
    reg [7:0] instruction_reg;
    
    initial begin
        rw = WRITE;
                x_acc_reg_temp = 0;
                y_acc_reg_temp = 0;
                z_acc_reg_temp = 0;
                n_CS = 1;
                instruction_reg = REGISTER_WRITE;
                address = CON_REG;
                roundDone = 1;
                roundDD = 1;
                SPI_state = BEGIN1;
                counter = 7; //counts down to 0
                //reset data for initial control write (measurement mode)
                accel_data[7:2] = 0;
                accel_data[1:0] = 2'b10; //measurement mode
                MOSI = 0;
    end
    
    always@(posedge clk_SPI) begin
        if(!reset) begin
            rw <= WRITE;
            x_acc_reg_temp <= 0;
            y_acc_reg_temp <= 0;
            z_acc_reg_temp <= 0;
            n_CS <= 1;
            instruction_reg <= REGISTER_WRITE;
            address <= CON_REG;
            roundDone <= 1;
            roundDD <= 1;
            SPI_state <= BEGIN1;
            counter <= 7; //counts down to 0
            //reset data for initial control write (measurement mode)
            accel_data[7:2] <= 0;
            accel_data[1:0] <= 2'b10; //measurement mode
        end
        else begin
            roundDD <= roundDone;
        
            if(SPI_state == INSTRUCTION || SPI_state == ADDRESS || SPI_state == DATAIN || SPI_state == DATAOUT) begin
           		if(counter == 0) begin //counter must reach 0 before moving onto next state          
            		counter <= 7;
            		if(SPI_state == INSTRUCTION) SPI_state <= ADDRESS;
            		else if(SPI_state == ADDRESS && rw) SPI_state <= DATAOUT; //this is a write, don't need to wait an extra clk edge, immediately stwriting
            		else if(SPI_state == DATAOUT || SPI_state == DATAIN) begin
            		    SPI_state <= END1; //hold cs an extra cloc cycle for hold time constraint
            		end
            		else begin
            		    roundDone <= 0; //new data being set, current no longer valid for sync
            			SPI_state <= DATAIN; //read, wait another neg edge before recieving data, data comes in starting in 2 clock edges
            		end
            	end
            	else counter <= counter - 1;
            end  
            if(SPI_state == BEGIN1) SPI_state <= BEGIN;
        	else if(SPI_state == BEGIN) begin
        	   n_CS <= 0;
        	   SPI_state <= INSTRUCTION;
        	end
        	else if(SPI_state == END) begin
        	   SPI_state <= BEGIN;
        	   accel_data <= 0;
        	   case(address) //determine next address and if next step is read/write
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
                   CON_REG : begin //done with intial write to control, start measurement reads
                       address <= X_L_REG;
                       rw <= 0;
                       instruction_reg <= REGISTER_READ;
                   end
               endcase
        	end
        	else if(SPI_state == DATAIN) begin //posedge triggers, read data at posedges of clk when valid
        	   accel_data[counter] <= MISO;
        	end
        	else if(SPI_state == END1) begin 
        	   SPI_state <= END;
        	   n_CS <= 1;
        	end
        end
     end
     
     always@(negedge clk_SPI) begin //start negedge Logic (output bit on negedge)
        if(!reset) begin
            MOSI <= 0;
        end
        else begin
        	if(SPI_state == INSTRUCTION) MOSI <= instruction_reg[counter];
        	else if(SPI_state == ADDRESS) MOSI <= address[counter];
        	else if(SPI_state == DATAOUT) MOSI <= accel_data[counter];
        end
        
     end
    
endmodule
