module avoid_obstacle_left(clk,echo,left_time);//超声波避障模块,左部分
input clk,echo;	//时钟，回响信号
output reg [19:0]left_time;	//回响时间

reg [19:0]count;

always@(posedge clk)
begin
	if(echo)
	begin
		count<=count+1;
	end
	else
	begin
		if(count!=0)
		begin
		left_time<=count;//如果在回响信号为0时，计数信号不为0，那么就把计数时间赋值给回想时间
			count<=0;
		end
		else
		begin
//		left_time<=0;	//如果在回响信号为0时，计数信号为0，那么就意味没有计时，所以给一个0信号，在之后的考虑中，不能认为0是接触
		end
	end
end
endmodule