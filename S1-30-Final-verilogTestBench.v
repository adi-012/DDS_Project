module main();
	
	reg clk1,clk2,clk3,clk4,clk5,clk6,clk7,clk8,clk9,reset;
	wire winP1,winP2,draw,i1p1,i1p2,i2p1,i2p2,i3p1,i3p2,i4p1,i4p2,i5p1,i5p2,i6p1,i6p2,i7p1,i7p2,i8p1,i8p2,i9p1,i9p2,xI1,xI2,xI3,xI4,xI5,xI6,xI7,xI8,xI9;
	
	game lol(clk1,clk2,clk3,clk4,clk5,clk6,clk7,clk8,clk9,reset,winP1,winP2,draw,i1p1,i1p2,i2p1,i2p2,i3p1,i3p2,i4p1,i4p2,i5p1,i5p2,i6p1,i6p2,i7p1,i7p2,i8p1,i8p2,i9p1,i9p2,xI1,xI2,xI3,xI4,xI5,xI6,xI7,xI8,xI9);
	
	initial begin
		clk1=0;clk2=0;clk3=0;clk4=0;clk5=0;clk6=0;clk7=0;clk8=0;clk9=0;reset=1;
		#1 reset =0;
		#2 reset =1;
		#1 clk1 = 1;
		#1 clk1 = 0;
		#1 clk5 = 1;
		#1 clk5 = 0;
		#1 clk2 = 1;
		#1 clk2 = 0;
		#1 clk1 = 1;
		#1 clk1 = 0;
		#1 clk7 = 1;
		#1 clk7 = 0;
		#1 clk3 = 1;
		#1 clk3 = 0;
		#1 clk6 = 1;
		#1 clk6 = 0;
	end
	
	always @ (posedge reset or negedge clk1 or negedge clk2 or negedge clk3 or negedge clk4 or negedge clk5 or negedge clk6 or negedge clk7 or negedge clk8 or negedge clk9) begin
			$display("%b\t%b\t%b\n",i1p1,i2p1,i3p1);
			$display("%b\t%b\t%b\n\n\n",i1p2,i2p2,i3p2);
			$display("%b\t%b\t%b\n",i4p1,i5p1,i6p1);
			$display("%b\t%b\t%b\n\n\n",i4p2,i5p2,i6p2);
			$display("%b\t%b\t%b\n",i7p1,i8p1,i9p1);
			$display("%b\t%b\t%b\n\n\n",i7p2,i8p2,i9p2);
			$display("--------------------\n\n");
			$display("Is player1 winning : %b\n",winP1);
			$display("Is player2 winning : %b\n",winP2);
			$display("Is the game a draw : %b\n\n",draw);
			$display("--------------------\n\n");
	end
	
endmodule