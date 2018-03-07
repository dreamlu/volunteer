window.onload=function(){
	
	//label点击
	
	var home1_label=document.getElementsByClassName("lab")
	for(var i = 0;i<home1_label.length;i++){
		home1_label[i].index=false;
	}
	
	for(var i = 0;i<home1_label.length;i++){
		home1_label[i].onclick=function(){
			if(this. index==false){
				this.style.background="#f1c45b";
				this.index=true;
			}else{
				this.style.background="#eae6dc";
				this.index=false;
			}
		}
	}
	
	
	//页面切换
	var home_nav1=document.getElementById("home_nav1")
	var home_nav2=document.getElementById("home_nav2")
	var home_nav3=document.getElementById("home_nav3")
	var home_nav4=document.getElementById("home_nav4")
	home_nav1.onclick=function(){
		home_nav1.style.backgroundColor="#E2DFD7"
		home_nav2.style.backgroundColor=""
		home_nav3.style.backgroundColor=""
		home_nav4.style.backgroundColor=""
	}
	home_nav2.onclick=function(){
		home_nav1.style.backgroundColor=""
		home_nav2.style.backgroundColor="#E2DFD7"
		home_nav3.style.backgroundColor=""
		home_nav4.style.backgroundColor=""
		alert("hha")
	}
	home_nav3.onclick=function(){
		home_nav1.style.backgroundColor=""
		home_nav2.style.backgroundColor=""
		home_nav3.style.backgroundColor="#E2DFD7"
		home_nav4.style.backgroundColor=""
	}
	home_nav4.onclick=function(){
		home_nav1.style.backgroundColor=""
		home_nav2.style.backgroundColor=""
		home_nav3.style.backgroundColor=""
		home_nav4.style.backgroundColor="#E2DFD7"
	}

}

//轮播
$(function(){
	/*======右按钮======*/
	$(".you").click(function(){
		nextscroll();
	});
	function nextscroll(){
		var vcon = $(".v_cont");
		var offset = ($(".v_cont li").width())*-1;
		vcon.stop().animate({marginLeft:offset},"slow",function(){
			var firstItem = $(".v_cont ul li").first();
			vcon.find(".flder").append(firstItem);
			$(this).css("margin-left","0px");
		});
	};
	/*========左按钮=========*/
	$(".zuo").click(function(){
		var vcon = $(".v_cont");
		var offset = ($(".v_cont li").width()*-1);
		var lastItem = $(".v_cont ul li").last();
		vcon.find(".flder").prepend(lastItem);
		vcon.css("margin-left",offset);
		vcon.animate({marginLeft:"0px"},"slow")
	});
});
//轮播2
$(function(){
	/*======右按钮======*/
	$(".you1").click(function(){
		nextscroll();
	});
	function nextscroll(){
		var vcon = $(".v_cont1");
		var offset = ($(".v_cont1 li").width())*-1;
		vcon.stop().animate({marginLeft:offset},"slow",function(){
			var firstItem = $(".v_cont1 ul li").first();
			vcon.find(".flder1").append(firstItem);
			$(this).css("margin-left","0px");
		});
	};
	/*========左按钮=========*/
	$(".zuo1").click(function(){
		var vcon = $(".v_cont1");
		var offset = ($(".v_cont1 li").width()*-1);
		var lastItem = $(".v_cont1 ul li").last();
		vcon.find(".flder1").prepend(lastItem);
		vcon.css("margin-left",offset);
		vcon.animate({marginLeft:"0px"},"slow")
	});
});