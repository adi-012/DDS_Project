module dff(input d,clk,rst,output q);
	
	reg qReg;
	
	always @ (posedge clk or negedge rst) begin
		if (~rst) begin
			qReg<=0;
		end
		else begin
			qReg<=d;
		end
	end
	
	assign q = qReg;
	
endmodule

module takeInput(input clk,rst,p1t,p2t,winP1,winP2,output p1o,p2o,xp);
	
	wire const1;
	assign const1 = 1;
	
	wire gameOver;
	
	assign gameOver = const1 & (~winP1) & (~winP2);
	
	wire q1;
	
	dff df1(gameOver,clk,rst,q1);
	dff df2(p1t,q1,rst,p1o);
	dff df3(p2t,q1,rst,p2o);
	
	assign xp = p1o^p2o;
	
endmodule

module decideTurn(input xI1,xI2,xI3,xI4,xI5,xI6,xI7,xI8,xI9, output p1t,p2t);
	
	xor(p2t,xI1,xI2,xI3,xI4,xI5,xI6,xI7,xI8,xI9);
	not(p1t,p2t);
	
endmodule

module checkWin(input o1,o2,o3,o4,o5,o6,o7,o8,o9,output win);
	wire a1,a2,a3,a4,a5,a6,a7,a8;
	
	and(a1,o1,o2,o3);
	and(a2,o4,o5,o6);
	and(a3,o7,o8,o9);
	and(a4,o1,o4,o7);
	and(a5,o2,o5,o8);
	and(a6,o3,o6,o9);
	and(a7,o1,o5,o9);
	and(a8,o3,o5,o7);
	
	or(win,a1,a2,a3,a4,a5,a6,a7,a8);
	
endmodule

module checkDraw(input xI1,xI2,xI3,xI4,xI5,xI6,xI7,xI8,xI9,winP1,winP2, output draw);
	wire nWinP1,nWinP2;
	not(nWinP1,winP1);
	not(nWinP2,winP2);
	
	and(draw,xI1,xI2,xI3,xI4,xI5,xI6,xI7,xI8,xI9,nWinP1,nWinP2);
	
endmodule

module game(input clk1,clk2,clk3,clk4,clk5,clk6,clk7,clk8,clk9,reset,output winP1,winP2,draw,i1p1,i1p2,i2p1,i2p2,i3p1,i3p2,i4p1,i4p2,i5p1,i5p2,i6p1,i6p2,i7p1,i7p2,i8p1,i8p2,i9p1,i9p2,xI1,xI2,xI3,xI4,xI5,xI6,xI7,xI8,xI9);
	
	
	takeInput i1(clk1,reset,p1t,p2t,winP1,winP2,i1p1,i1p2,xI1);
	takeInput i2(clk2,reset,p1t,p2t,winP1,winP2,i2p1,i2p2,xI2);
	takeInput i3(clk3,reset,p1t,p2t,winP1,winP2,i3p1,i3p2,xI3);
	takeInput i4(clk4,reset,p1t,p2t,winP1,winP2,i4p1,i4p2,xI4);
	takeInput i5(clk5,reset,p1t,p2t,winP1,winP2,i5p1,i5p2,xI5);
	takeInput i6(clk6,reset,p1t,p2t,winP1,winP2,i6p1,i6p2,xI6);
	takeInput i7(clk7,reset,p1t,p2t,winP1,winP2,i7p1,i7p2,xI7);
	takeInput i8(clk8,reset,p1t,p2t,winP1,winP2,i8p1,i8p2,xI8);
	takeInput i9(clk9,reset,p1t,p2t,winP1,winP2,i9p1,i9p2,xI9);
	
	decideTurn turnDecide(xI1,xI2,xI3,xI4,xI5,xI6,xI7,xI8,xI9,p1t,p2t);
	
	
	checkWin p1(i1p1,i2p1,i3p1,i4p1,i5p1,i6p1,i7p1,i8p1,i9p1,winP1);
	checkWin p2(i1p2,i2p2,i3p2,i4p2,i5p2,i6p2,i7p2,i8p2,i9p2,winP2);
	
	checkDraw drawCheck(xI1,xI2,xI3,xI4,xI5,xI6,xI7,xI8,xI9,winP1,winP2,draw);
	
	
endmodule