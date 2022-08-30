module traffic_controller(clk,rst,n_r,n_y,n_g,s_r,s_y,s_g,e_r,e_y,e_g,w_r,w_y,w_g);
parameter r2y = 30;
parameter y2g = 3;
parameter g2r = 10;
input clk,rst;
output reg n_r,n_y,n_g,s_r,s_y,s_g,e_r,e_y,e_g,w_r,w_y,w_g;

always @(posedge clk) begin
	if(rst)begin
	n_r=0; n_y=0; n_g=0;
	s_r=0; s_y=0; s_g=0;
	w_r=0; w_y=0; w_g=0;
	e_r=0; e_y=0; e_g=0;
	end
	else begin
	
	end
end
