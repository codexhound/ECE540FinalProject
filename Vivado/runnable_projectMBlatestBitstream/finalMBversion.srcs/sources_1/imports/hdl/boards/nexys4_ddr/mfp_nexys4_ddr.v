// mfp_nexys4_ddr.v
// January 1, 2017
//
// Instantiate the mipsfpga system and rename signals to
// match the GPIO, LEDs and switches on Digilent's (Xilinx)
// Nexys4 DDR board

// Outputs:
// 16 LEDs (IO_LED) 
// Inputs:
// 16 Slide switches (IO_Switch),
// 5 Pushbuttons (IO_PB): {BTNU, BTND, BTNL, BTNC, BTNR}
//

`include "mfp_ahb_const.vh"

module mfp_nexys4_ddr( 
                        input                   CLK100MHZ,
                        input                   CPU_RESETN,
                        input                   BTNU, BTND, BTNL, BTNC, BTNR, 
                        input  [`MFP_N_SW-1 :0] SW,         
                        output [`MFP_N_LED-1:0] LED,
                        inout  [ 8          :1] JB,
                        input                   UART_TXD_IN,
                        output                  CA,CB,CC,CD,CE,CF,CG,DP,
                        output [7:0]            AN,
                        output                  VGA_HS, VGA_VS,
                        output [3:0]            VGA_R, VGA_G, VGA_B,
                        //ADXL362 Accelerometer PINS
                        output                  ACL_MOSI, ACL_SCLK, ACL_CSN,
                        input                   ACL_MISO,
                        input  [2:0]            ACL_INT
                        );
                        
  // Press btnCpuReset to reset the processor. 
        
  wire clk_out50, clk_out75; 
  wire tck_in, tck;
  
  wire [11:0] x_acc_w, y_acc_w, z_acc_w;
  
  
   //ADXL362 Accelerometer defines
  wire ADXCLK, N_ADXCS, MISO, MOSI, INT1, INT2;
  
  assign ACL_SCLK = ADXCLK;
  assign ACL_CSN = N_ADXCS;
  assign ACL_MOSI = MOSI;
  assign MISO = ACL_MISO;
  assign INT2 = ACL_INT[2];
  assign INT1 = ACL_INT[1];

  clk_wiz_0 clk_wiz_0(.clk_in1(CLK100MHZ), .clk_out1(clk_out50), .clk_out2(clk_out75), .clk_out3(ADXCLK));
  IBUF IBUF1(.O(tck_in),.I(JB[4]));
  BUFG BUFG1(.O(tck), .I(tck_in));
  
  mhp_axdl362 mhp_axd1362(
      .clk_50(clk_out50), 
      .clk_SPI(ADXCLK), 
      .reset(pbtn_db[5]), 
      .MISO(MISO),
      .MOSI(MOSI), 
      .n_CS(N_ADXCS),
      .x_acc_reg(x_acc_w), 
      .y_acc_reg(y_acc_w), 
      .z_acc_reg(z_acc_w)
      );
     
  wire [5:0] pbtn_db;
  wire [15:0] switch_db;
  wire [7:0] dispenout;
  wire [7:0] dispout;
  wire [31:0] haddr;
  wire [31:0] hrdata;
  wire [31:0] hwdata;
  wire hwrite, video_on;
  wire [5:0] pbtn_in;
  wire [31:0] IO_BOTINFO;
  
  //ball bot signals//////////////////////////////////////
  wire soft_rst, mazeEnd, hitMazeWall, deadlock;  
  wire [1:0] x_speed, y_speed;
  wire [7:0] iobotcntr, LocX_reg, LocY_reg, iobotinfo;
  wire [2:0] ball_dir, ball_direction_internal;
  wire [3:0] speed_info;
  
  assign speed_info[3:2] = x_speed;
  assign speed_info[1:0] = y_speed;

  assign y_speed = iobotcntr[7:6];
  assign x_speed = iobotcntr[5:4];
  assign ball_dir = iobotcntr[2:0];

  assign iobotinfo[7:6] = 0;
  assign iobotinfo[5] = mazeEnd;
  assign iobotinfo[4] = hitMazeWall;
  assign iobotinfo[3] = deadlock;
  assign iobotinfo[2:0] = ball_direction_internal;

  assign IO_BOTINFO[31:28] = 0;
  assign IO_BOTINFO[27:24] = speed_info;
  assign IO_BOTINFO[23:16] = LocX_reg;
  assign IO_BOTINFO[15:8] = LocY_reg;
  assign IO_BOTINFO[7:0] = iobotinfo;

  /////////////////////////////////////////////////////////
  wire [13:0] worldmap_addr, vid_addr;
  wire [11:0] pixel_row, pixel_column;    
  wire [1:0] icon, worldmap_data_shifted, world_pixel_shifted;    
  
  reg [1:0] worldmap_data, world_pixel;
 
  wire [2:0] LSEL;                          // Level Select
  wire [1:0] world_pixel_level1;
  wire [1:0] world_pixel_level2;
  wire [1:0] world_pixel_level3;
  wire [1:0] world_pixel_gameover;
  wire [1:0] world_pixel_levelcomplete;
  wire [1:0] world_pixel_youwin;
  wire [1:0] world_pixel_debug;
  wire [1:0] worldmap_data_level1;
  wire [1:0] worldmap_data_level2;
  wire [1:0] worldmap_data_level3;
  wire [1:0] worldmap_data_gameover;
  wire [1:0] worldmap_data_levelcomplete;
  wire [1:0] worldmap_data_youwin;
  wire [1:0] worldmap_data_debug;
    
  assign pbtn_in[5] = CPU_RESETN;
  assign pbtn_in[4] = BTNC;
  assign pbtn_in[3] = BTNL;
  assign pbtn_in[2] = BTNU;
  assign pbtn_in[1] = BTNR;
  assign pbtn_in[0] = BTND;
  
  assign DP = dispout[7]; //assigning these based on mfp_ahb_sevensegdec.v
  assign CA = dispout[6];
  assign CB = dispout[5];
  assign CC = dispout[4];
  assign CD = dispout[3];
  assign CE = dispout[2];
  assign CF = dispout[1];
  assign CG = dispout[0];
  
  assign AN = dispenout;
  
 
 
  ///////////////////////////////////////////////////
                                        
 debounce debounce(
                                 .clk(clk_out50),
                                 .pbtn_in(pbtn_in),
                                 .switch_in(SW),
                                 .pbtn_db(pbtn_db),
                                 .swtch_db(switch_db));
                                                                                 
 mfp_sys mfp_sys(
                    .SI_Reset_N(pbtn_db[5]),
                    .SI_ClkIn(clk_out50),
                    .HADDR(haddr),
                    .HRDATA(hrdata),
                    .HWDATA(hwdata),
                    .HWRITE(hwrite),
                    .HSIZE(),
                    .EJ_TRST_N_probe(JB[7]),
                    .EJ_TDI(JB[2]),
                    .EJ_TDO(JB[3]),
                    .EJ_TMS(JB[1]),
                    .EJ_TCK(tck),
                    .SI_ColdReset_N(JB[8]),
                    .EJ_DINT(1'b0),
                    .IO_Switch(switch_db),
                    .IO_PB(pbtn_db[4:0]),
                    .IO_LED(LED),
                    .disenout(dispenout),
                    .disout(dispout),
                    .UART_RX(UART_TXD_IN),
                    
                    .x_acc(x_acc_w),
                    .y_acc(y_acc_w),
                    .z_acc(z_acc_w),

                    //ball robot inputs/outputs
                    .soft_reset(soft_rst), //(i)
                    .IO_BotCtrl(iobotcntr), //(i)
                    .IO_BotInfo(IO_BOTINFO), //(o)
                    
                    // world map level select
                    .LSEL(LSEL)
                    );                                                          

//delay world pixel by 1 more clks after change in display in (2 total)
//reason is it takes icon pixel 2 clks for valid data after change of display in(pipelining) 
/*delayWorldPixel delayWorldPixel(
       .clk(clk_out75),
       .dina(worldmap_data),
       .dinb(world_pixel),
       .douta(worldmap_data_shifted),
       .doutb(world_pixel_shifted)
        );                                          
*/

/////////////////////////////WORLD MAPS///////////////////////////////////


worldmap_level1 worldmap_level1(
    .clka(clk_out75),
    .addra(worldmap_addr),
    .douta(worldmap_data_level1),
    .clkb(clk_out75),
    .addrb(vid_addr),
    .doutb(world_pixel_level1));

    
worldmap_level2 worldmap_level2(
        .clka(clk_out75),
        .addra(worldmap_addr),
        .douta(worldmap_data_level2),
        .clkb(clk_out75),
        .addrb(vid_addr),
        .doutb(world_pixel_level2));
        
worldmap_level3 worldmap_level3(
            .clka(clk_out75),
            .addra(worldmap_addr),
            .douta(worldmap_data_level3),
            .clkb(clk_out75),
            .addrb(vid_addr),
            .doutb(world_pixel_level3));

worldmap_gameover worldmap_gameover(
            .clka(clk_out75),
            .addra(worldmap_addr),
            .douta(worldmap_data_gameover),
            .clkb(clk_out75),
            .addrb(vid_addr),
            .doutb(world_pixel_gameover));
            
worldmap_debug worldmap_debug(
            .clka(clk_out75),
            .addra(worldmap_addr),
            .douta(worldmap_data_debug),
            .clkb(clk_out75),
            .addrb(vid_addr),
            .doutb(world_pixel_debug));
            
worldmap_youwin worldmap_youwin(
            .clka(clk_out75),
            .addra(worldmap_addr),
            .douta(worldmap_data_youwin),
            .clkb(clk_out75),
            .addrb(vid_addr),
            .doutb(world_pixel_youwin));

worldmap_levelcomplete worldmap_levelcomplete(
            .clka(clk_out75),
            .addra(worldmap_addr),
            .douta(worldmap_data_levelcomplete),
            .clkb(clk_out75),
            .addrb(vid_addr),
            .doutb(world_pixel_levelcomplete));
//assign LSEL = 3'b011;                                          
always @ (*) begin
    case(LSEL)
        3'b000: begin
            world_pixel = world_pixel_gameover;
            worldmap_data = worldmap_data_gameover;
            end
        3'b001: begin
            world_pixel = world_pixel_level1;
            worldmap_data = worldmap_data_level1;
            end
        3'b010: begin
            world_pixel = world_pixel_level2;
            worldmap_data = worldmap_data_level2;
            end
        3'b011: begin
            world_pixel = world_pixel_level3;
            worldmap_data = worldmap_data_level3;
            end
        3'b100: begin
            world_pixel = world_pixel_levelcomplete;
            worldmap_data = worldmap_data_levelcomplete;
            end
        3'b101: begin
            world_pixel = world_pixel_youwin;
            worldmap_data = worldmap_data_youwin;
            end
        3'b110: begin
            world_pixel = world_pixel_debug;
            worldmap_data = worldmap_data_debug;
            end
        default: begin
            world_pixel = world_pixel_gameover;
            worldmap_data = worldmap_data_gameover;
            end
    endcase
end
///////////////////////////////////////////////////////////////// 

   maze_bot maze_bot(
        .clk(clk_out75),
        .ball_direction(ball_dir),
        .LocX_reg(LocX_reg),
        .LocY_reg(LocY_reg),
        .rst(pbtn_db[5]),
        .soft_rst(soft_rst),
        .x_speed(x_speed),
        .y_speed(y_speed),
        .mapPixel(worldmap_data),
        .mazeEnd(mazeEnd), 
        .hitMazeWall(hitMazeWall), 
        .deadlock(deadlock),
        .mapAddress(worldmap_addr),
        .internal_ball_direction(ball_direction_internal)
    );                                       


    dtg dtg (
        .clock(clk_out75), 
        .rst(~pbtn_db[5]),
        .horiz_sync(VGA_HS),
        .vert_sync(VGA_VS), 
        .video_on(video_on),        
        .pixel_row(pixel_row), 
        .pixel_column(pixel_column));
        
    videoScale videoScale(
        .pixel_row(pixel_row),
        .pixel_col(pixel_column),
        .vid_addr(vid_addr));
        
    colorizer colorizer(
        .video_on(video_on),
        .world_pixel(world_pixel),
        .icon(icon),
        .red(VGA_R),
        .green(VGA_G),
        .blue(VGA_B));
    
    icon icon1(
          .clk(clk_out75),
          .locXReg(LocX_reg),
          .locYReg(LocY_reg),
          .pixel_row(pixel_row),
          .pixel_column(pixel_column),
          .icon(icon));

endmodule
