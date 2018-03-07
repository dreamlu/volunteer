//滚动条定位  
var _h = 0;
  function SetH(o) {
	   _h = o.scrollTop
	   SetCookie("a", _h)
  }
  window.onload = function () {
	  document.getElementById("x").scrollTop = GetCookie("a");//页面加载时设置scrolltop高度
  }
  function SetCookie(sName, sValue) {
	  document.cookie = sName + "=" + escape(sValue) + "; ";
  }
  function GetCookie(sName) {
	   var aCookie = document.cookie.split("; ");
	   for (var i = 0; i < aCookie.length; i++) {
	   var aCrumb = aCookie[i].split("=");
	   if (sName == aCrumb[0])
		   return unescape(aCrumb[1]);
	   }
	   return 0;
  }
//报名
  function clickImgEnter(volunteer,user_name,hasEnter)
	{
	  	
		//var content = document.getElementsByClassName("like");
		//alert(user_name);
		//alert(volunteer);
		//ajax异步发送数据
		//xmlHttp对象
	  if(user_name!="$")//登陆
	  {
		  if(hasEnter=='hasEnter')
		  {
			  var select_time;
			  $('body').dialogbox({type:"text",title:"时间段",message:"请输入你的空余时间"},
			            function($btn,$ans){
			                if($btn == "close"){
			                    $('body').dialogbox({type:"normal",title:"Result",message:"确定退出吗？"});
			                }
			                else if($btn == "ok") {
			                    $('body').dialogbox({type:"normal",title:"Result",message:"你选择了: " + $ans});
			                    select_time=$ans;

			                    xmlHttp = createXMLHttp();
			            		//alert(xmlHttp);
			            		//给服务器发送数据
			            		var url = "volunteerEnter?volunteer_name="+volunteer+"&select_time="+select_time+"";
			            		//alert(url);
			            		
			            		//true表示js会在send()方法之后继续执行，不会等待来自服务器的相应
			            		xmlHttp.open("GET",url,true);
			            		//xmlHttp绑定回调方法，会在xmlHttp状态改变之后被调用
			            		//xmlHttp状态0-4，4表示完成
			            		xmlHttp.onreadystatechange=callback;
			            		xmlHttp.send();//传送数据，内容在url中
			                }
			            });
		  }
		  else
		  {
			xmlHttp = createXMLHttp();
      		//alert(xmlHttp);
      		//给服务器发送数据
      		var url = "volunteerEnter?volunteer_name="+volunteer+"";
      		//alert(url);
      		
      		//true表示js会在send()方法之后继续执行，不会等待来自服务器的相应
      		xmlHttp.open("GET",url,true);
      		//xmlHttp绑定回调方法，会在xmlHttp状态改变之后被调用
      		//xmlHttp状态0-4，4表示完成
      		xmlHttp.onreadystatechange=callback;
      		xmlHttp.send();//传送数据，内容在url中
		  }
		  
	  }
	  else
	  {
		  //alert(user_name);
		  var d = dialog({				
			    title: '志愿者',
			    content: '请先登录志愿者网站'
			});
			d.show();
			setTimeout(function () {
			    d.close().remove();
			}, 2000);
	  }
	}
  
//报名
  function clickImgEnter2(volunteer,user_name)
  {
  		//var content = document.getElementsByClassName("like");
  		//alert(user_name);
  		//alert(volunteer);
  		//ajax异步发送数据
  		//xmlHttp对象
  		if(user_name!="$")//登陆
  		{
  			 
  			xmlHttp = createXMLHttp();
  			//alert(xmlHttp);
  			//给服务器发送数据
  			var url = "volunteerEnter?volunteer_name="+volunteer+"";//escape(content.value);
  			//alert(url);
  			
  			//true表示js会在send()方法之后继续执行，不会等待来自服务器的相应
  			xmlHttp.open("GET",url,true);
  			//xmlHttp绑定回调方法，会在xmlHttp状态改变之后被调用
  			//xmlHttp状态0-4，4表示完成
  			xmlHttp.onreadystatechange=callback;
  			xmlHttp.send();//传送数据，内容在url中
  		}
  		else//未登录
  		{
  			var d = dialog({				
  			    title: '志愿者',
  			    content: '请先登录志愿者网站'
  			});
  			d.show();
  			setTimeout(function () {
  			    d.close().remove();
  			}, 2000);
  		}
  } 
//收藏 志愿活动
function clickImg(volunteer,user_name)
{
		//var content = document.getElementsByClassName("like");
		//alert(user_name);
		//alert(volunteer);
		//ajax异步发送数据
		//xmlHttp对象
		if(user_name!="$")//登陆
		{
			 
			xmlHttp = createXMLHttp();
			//alert(xmlHttp);
			//给服务器发送数据
			var url = "collectionVolunteer?collection="+volunteer+"";//escape(content.value);
			//alert(url);
			
			//true表示js会在send()方法之后继续执行，不会等待来自服务器的相应
			xmlHttp.open("GET",url,true);
			//xmlHttp绑定回调方法，会在xmlHttp状态改变之后被调用
			//xmlHttp状态0-4，4表示完成
			xmlHttp.onreadystatechange=callback;
			xmlHttp.send();//传送数据，内容在url中
		}
		else//未登录
		{
			var d = dialog({				
			    title: '志愿者',
			    content: '请先登录志愿者网站'
			});
			d.show();
			setTimeout(function () {
			    d.close().remove();
			}, 2000);
		}
}
//收藏志愿项目
function clickImgProject(project,user_name)
{
		//var content = document.getElementsByClassName("like");
		//alert(user_name);
		//alert(project);
		//ajax异步发送数据
		//xmlHttp对象
		if(user_name!="$")//登陆
		{
			//alert(user_name); 
			xmlHttp = createXMLHttp();
			//alert(xmlHttp);
			//给服务器发送数据
			var url = "collectionProject?collection="+project+"";//escape(content.value);
			//alert(url);
			
			//true表示js会在send()方法之后继续执行，不会等待来自服务器的相应
			xmlHttp.open("GET",url,true);
			//xmlHttp绑定回调方法，会在xmlHttp状态改变之后被调用
			//xmlHttp状态0-4，4表示完成
			xmlHttp.onreadystatechange=callback;
			/*function()
			{
				setTimeout("setlocation.reload()",500);
			}*/
			xmlHttp.send();//传送数据，内容在url中
		}
		else//未登录
		{
			var d = dialog({				
			    title: '志愿者',
			    content: '请先登录志愿者网站'
			});
			d.show();
			setTimeout(function () {
			    d.close().remove();
			}, 2000);
		}
}
	
	function createXMLHttp()
	{
		var xmlHttp;
		if(window.XMLHttpRequest)
		{
			xmlHttp = new XMLHttpRequest();
		}
		if(window.ActiveXObject)
		{
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			if(!xmlHttp)
			{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}
		}
		return xmlHttp;
	}
	//回调函数
	function callback()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status == 200)//响应成功
			{
				//交互成功，获得的是文本格式
				var result = xmlHttp.responseText;
				//alert(result);
				var s = new String(result);
				var d = dialog({
				    title: '志愿者',
				    content: result
				});
				d.show();
				setTimeout(function () {
				    d.close().remove();
				}, 2000);
				//alert(result);
				
				setTimeout("location.reload()",2000);
			}
		}
	}

//关键字搜索
	//获取用户输入的处理函数
	function getMoreContents()
	{
		var content = document.getElementById("activity_sousuo");
		if(content.value=="")
		{
			clearContent();
			return;
		}
		//ajax异步发送数据
		//xmlHttp对象
		xmlHttp = createXMLHttp();
		//alert(xmlHttp);
		//给服务器发送数据
		var url = "search?keyword="+content.value+"";//escape(content.value);
		//alert(url);
		
		//true表示js会在send()方法之后继续执行，不会等待来自服务器的相应
		xmlHttp.open("GET",url,true);
		//xmlHttp绑定回调方法，会在xmlHttp状态改变之后被调用
		//xmlHttp状态0-4，4表示完成
		xmlHttp.onreadystatechange=callback2;
		xmlHttp.send();//传送数据，内容在url中
	}
	
	/*function createXMLHttp()
	{
		var xmlHttp;
		if(window.XMLHttpRequest)
		{
			xmlHttp = new XMLHttpRequest();
		}
		if(window.ActiveXObject)
		{
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			if(!xmlHttp)
			{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			}
		}
		return xmlHttp;
	}*/
	//回调函数
	function callback2()
	{
		if(xmlHttp.readyState==4)
		{
			if(xmlHttp.status == 200)//响应成功
			{
				//交互成功，获得的是文本格式
				var result = xmlHttp.responseText;
				//alert(result);
				//解析获得数据
				var json = eval("("+result+")");
				//获得数据后，可以动态地展示这些数据到输入框的下面
				setContent(json);
			}
		}
	}
	
	//设置关联的数据的展示
	function setContent(contents)
	{
		clearContent();
		setLocation();
		//用来动态生成数据的的长度，<tr><td>的个数
		var size=contents.length;
		//设置内容
		for(var i=0;i<size;i++)
		{
			var nextNode=contents[i];//json数据的第i个元素
			//alert(nextNode);
			//nextNode="<a href=\"<%=basePath%>detail_activity?volunteer_name="+nextNode+"&user_look=user_look\">"+nextNode+"</a>";

			var tr=document.createElement("tr");
			var td=document.createElement("td");
			td.setAttribute("border", "0");
			td.setAttribute("bgcolor", "#FFFAFA");
			td.onmouseover=function()
			{
				this.className='mouseOver';
			};
			td.onmouseout=function()
			{
				this.className='mouseOut';
			};
			//alert();
			/*td.onclick=function()
			{//当鼠标点击一个关联数据时，关联数据自动出现在输入框
				//alert("hehe");
				//location.href="detail_activity?volunteer_name="+nextNode+"&user_look=user_look";
			};*/
			
			//var text=document.createTextNode(nextNode);//文本节点
			//var text=document.innerHTML(nextNode);//文本节点
			td.innerHTML = "<a href='detail_activity?volunteer_name="+nextNode+"&user_look=user_look'>"+nextNode+"</a>";
			//alert(text);
			//td.appendChild(text);
			//alert(td);
			tr.appendChild(td);
			document.getElementById("content_table_body").appendChild(tr);
		}
	}
	//清空之前的数据
	function clearContent()
	{
		var contentT = document.getElementById("content_table_body");
		var size = contentT.childNodes.length;
		
		for(var i=size-1;i>=0;i--)
		{
			contentT.removeChild(contentT.childNodes[i]);
		}
		document.getElementById("popDiv").style.border="none";
	}
	
	/*function keywordBlur()
	{
		clearContent();
	}*/
	//设置关联信息的位置
	function setLocation()
	{
		var content = document.getElementById("activity_sousuo");
		var width = content.offsetWidth;//输入框的宽度
		var left = content["offsetLeft"];//到左边的距离
		var top = content["offsetTop"]+content.offsetHeight;//到顶部的距离
		//获取显示数据的Div
		var popDiv = document.getElementById("popDiv");
		popDiv.style.border="black 1px solid";
		popDiv.style.left = left+"px";
		popDiv.style.top = top+"px";
		popDiv.style.width = width+"px";
		document.getElementById("content_table_body").style.width=width+"px";
		
		
	}
	