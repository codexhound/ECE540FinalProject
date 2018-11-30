//calculates the speed using the hypotenuse of x and y
//also outputs two's compliment version of x and y accelerations

module speed_calc(
	input clk, rst,
	input [11:0] x_acc, y_acc,
	output reg [2:0] speed,
	output [11:0] x_acc_twoC, y_acc_twoC
	);

	parameter IDLE = 0,
			  SLOWEST = 1,
			  SLOW = 2,
			  FAST = 3,
			  FASTEST = 4;

	reg start_new_root, calc_root, x_neg, y_neg;
	reg [13:0] square_root, root_temp;
	reg [10:0] x_acc_reg, y_acc_reg, x_acc_cur, y_acc_cur;
	reg [2:0] speed_combo;
	reg [29:0] hyp_squared, root_squared_temp;

	reg signed [12:0] x_acc_diff, y_acc_diff;
	
	assign x_acc_twoC[11] = x_neg;
	assign x_acc_twoC[10:0] = x_acc_cur;
	
	assign y_acc_twoC[11] = y_neg;
    assign y_acc_twoC[10:0] = y_acc_cur;

	always@(*) begin

		x_acc_diff = x_acc_cur - x_acc_reg;
		y_acc_diff = y_acc_cur - y_acc_reg;

		if(x_acc_diff < 0) x_acc_diff = x_acc_diff * -1; //absolute value
		if(y_acc_diff < 0) y_acc_diff = y_acc_diff * -1; //absolute value
		
		//get two's compliment
		
		if(x_acc[11] == 1'b1) begin
		  x_acc_reg = (~x_acc[10:0]) + 1;
		end
		else x_acc_reg = x_acc[10:0];
		
		if(y_acc[11] == 1'b1) begin
		  y_acc_reg = (~y_acc[10:0]) + 1;
		end
		else y_acc_reg = y_acc[10:0];
		
        //get the speed from the square root of the hyp squared
		if(square_root < 200 && square_root >= 0) speed_combo = IDLE;
		else if(square_root < 400 && square_root >= 200) speed_combo = SLOWEST;
		else if(square_root < 600 && square_root >= 400) speed_combo = SLOW;
		else if(square_root < 800 && square_root >= 600) speed_combo = FAST;
		else speed_combo = FASTEST;

		//square root combo logic

        root_squared_temp = root_temp * root_temp;
		hyp_squared = x_acc_cur*x_acc_cur + y_acc_cur*y_acc_cur;
	end

	always@(posedge clk) begin
		if(!rst) begin
			speed <= 0;
			start_new_root <= 0;
			root_temp <= 0;
			calc_root <= 0;
			square_root <= 0;
			x_acc_cur <= 0;
			y_acc_cur <= 0;
			x_neg <= 0;
			y_neg <= 0;
		end
		else begin
			//tolerance logic, set internal x,y registers
			if(x_acc_diff > 75 || y_acc_diff > 75) begin
				x_acc_cur <= x_acc_reg;
				y_acc_cur <= y_acc_reg;
				x_neg <= x_acc[11];
				y_neg <= y_acc[11];
				start_new_root <= 1; //x,y changed, recalculate the hypotenuse using square root
			end

			speed <= speed_combo; //latch the speed register

			if(start_new_root)	begin
				start_new_root <= 0;
				root_temp <= 0;
				calc_root <= 1;
			end
			//calculate the square root of hyp squared
			else begin
				if(calc_root) begin
					if(root_squared_temp >= hyp_squared) begin
					   //found the approximate square root (integer)
						square_root <= root_temp;
						calc_root <= 0;
						root_temp <= 0;
					end
					else root_temp <= root_temp + 40;
				end
			end
		end
	end

endmodule