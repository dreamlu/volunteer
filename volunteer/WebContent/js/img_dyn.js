/**
 * 
 */

window.onload = function()
{
	t = 1;
	wrapper = document.getElementById("wrapper");
	d = document.getElementById("d");
	timer = setInterval("divMove()",50);
	
	wrapper.onmouseover = function()
	{
		clearInterval(timer);
	}
	wrapper.onmouseout = function()
	{
		timer = setInterval("Move()",50);
	}
}
//divMove()函数放Window.onload() = function(){}de
//内部或外部都是可以的
function Move()
{
	if(t == 1) divMove();
	else divMove2();
}
function divMove()
{
	if(d.offsetLeft < 0)
	{
		x = d.offsetLeft + 5;
		d.style.left = x + "px";
	}
	else t = 0;
}
function divMove2()
{
	if(d.offsetLeft > -800)
	{
		x = d.offsetLeft - 5;
		d.style.left = x + "px";
	}
	else t = 1;
}
