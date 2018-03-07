window.onload=function(){
	var like=document.getElementsByClassName("like");
	var baoming=document.getElementsByClassName("baoming");
	for(var i = 0;i<like.length;i++){
		like[i].index=false;
		}
	
	for(var i = 0;i<like.length;i++){
		like[i].onclick=function(){
			if(this. index==false){
				this.src="img/like.gif";
				this.index=true;
			}else{
				this.src='img/noLike.gif';
				this.index=false;
			}
		}
	}

	for(var i = 0;i<baoming.length;i++){
//		if(baoming[i].src=='../img/baoming.gif')
//		baoming[i].bao_index=true;
//		}else{
			baoming[i].bao_index=false;
		}
	
	for(var i = 0;i<baoming.length;i++){
		baoming[i].onclick=function(){
			if(this.bao_index==false){
				this.src="img/baoming.gif";
				this.bao_index=true;
			}else{
				this.src="img/nobaoming.jpg";
				this.bao_index=false;
			}
		}
	}
	
	
	
	var item_like=document.getElementsByClassName("item_like")
	for(var i = 0;i<item_like.length;i++){
		item_like[i].index=false;
		}
	
	for(var i = 0;i<item_like.length;i++){
		item_like[i].onclick=function(){
			if(this. index==false){
				this.src="img/item/item_like.jpg";
				this.index=true;
			}else{
				this.src="img/item/item_nolike.jpg";
				this.index=false;
			}
		}
	}
}
