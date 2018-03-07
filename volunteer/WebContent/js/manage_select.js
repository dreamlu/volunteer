
								window.onload=function(){
									
									var show = document.getElementsByClassName("show")
									var ad = document.getElementsByClassName("ad")
									var sub = document.getElementsByClassName("sub")
									
										ad[0].onclick = function(){
											show[0].style.display = "table";
											ad[0].style.display = "none";
											sub[0].style.display = "block";
										}
										ad[1].onclick = function(){
											show[1].style.display = "table";
											ad[1].style.display = "none";
											sub[1].style.display = "block";
										}
										sub[0].onclick = function(){
											show[0].style.display = "none";
											sub[0].style.display = "none";
											ad[0].style.display = "block";

										}
										sub[1].onclick = function(){
											show[1].style.display = "none";
											sub[1].style.display = "none";
											ad[1].style.display = "block";
										}
										
									var qx = document.getElementById('qx');
									qx.onclick = function(){
										if(this.checked==true) 
											{ checkAll('productId'); } 
										else { clearAll('productId'); }
									}
									var qx2 = document.getElementById('qx2');
									qx2.onclick = function(){
										if(this.checked == true)
											{ checkAll('productId2');}
										else { clearAll('productId2');}
									}

								function checkAll(name) { 
									var el = document.getElementsByTagName('input'); 
									var len = el.length; 
									for(var i=0; i<len; i++){ 
									if((el[i].type=="checkbox") && (el[i].name==name)){ 
										el[i].checked = true; 
										} 
									} 
								} 
								function clearAll(name) { 
									var el = document.getElementsByTagName('input'); 
									var len = el.length; 
									for(var i=0; i<len; i++){ 
										if((el[i].type=="checkbox") && (el[i].name==name)){ 
											el[i].checked = false; 
										} 
									}
								} 
								
							}
