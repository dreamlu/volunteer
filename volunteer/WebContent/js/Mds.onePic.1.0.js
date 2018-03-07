
;(function($,window,document,undefined){
	var Inits = function(ele,opts){
		this.$ele = ele,
		this.defaults = {
			_width: 910, //设置图轮播图大小
			_height: 340,
			page: 'page', //是否启用导航图标,有值时启用，值为导航图标列表的样式类，为空时不启用导航列表
			btn: 'false', //是否启用上下一页按钮，true为启用,false或者空为不启用。如果启用，请在下面的四个属性中赋值，为按钮添加样式类和按钮文字
			nextClass: 'next', //下一张 按钮样式类
			prevClass: 'prev',	//上一张 按钮样式类
			nextText: '>',
			prevText: '<',
			fade: 'normal', //图片切换速度 可能的值slow/normal/fast/毫秒(比如 1500)
			time: '', //可能的值(毫秒)1000\2000...
			pageNum: false, //是否启用数字做轮播导航 true为启用,false不启用
			pagelocat: true //轮播导航图标是否要居中 true/fasle 默认为居中
		},
		this.init = $.extend({}, this.defaults, opts);		
	}
	Inits.prototype = {
		slideFade: function(){
			var ul = this.$ele.children('ul.list');
			var li = ul.children('li');
			li.eq(0).show().siblings('li').hide();
			var init = this.init;
			//slide
			this.$ele.css({
				position: 'relative',
				width: init._width+'px',
				height: init._height+'px',
				margin: '0 auto'
			});
			li.css({
				position: 'absolute',
				left: 0,
				width: init._width+'px',
				height: init._height+'px'
			});
			li.find('img').css({
				width: '100%',
				height: '100%'
			});
			//page==buiding
			if (init.page!=''&&init.page!=undefined) {
				this.$ele.append('<ul class="'+init.page+'"></ul>');
				// buiding-page
				for (var i = 0; i < li.length; i++) {
					if (init.pageNum==true) {
						$('.'+init.page).append('<li>'+(i+1)+'</li>');
					}else if(init.pageNum==false){
						$('.'+init.page).append('<li>&nbsp;</li>');
					}
				};
				var page = $('.'+init.page);
				var pageli = page.children('li');
					pageli.css('float', 'left');
				var pageliw = Math.ceil(pageli.outerWidth(true)+0.05)*pageli.length;
				var pagetoleft = init._width/2-pageliw/2;
				pageli.eq(0).addClass('on');
				page.css({
					position: 'absolute',
					width: pageliw+'px'
				});
				if (init.pagelocat==true) {
					page.css('left', pagetoleft+'px');
				};
			};
			//btn==buiding
			if (init.btn==true) {
				this.$ele.append('<a href="javascript:;" class="sBtn">'+init.prevText+'</a><a href="javascript:;" class="sBtn">'+init.nextText+'</a>');
				var btntotop = Math.round(init._height/2-this.$ele.children('a.sBtn').height()/2);
				this.$ele.children('a.sBtn').css({
					position: 'absolute',
					top: btntotop+'px'
				});
				if (init.nextClass!=''||init.prevClass!='') {
					this.$ele.children('a.sBtn').eq(0).addClass(init.prevClass).next('a.sBtn').addClass(init.nextClass);
				}
			};
			//==========
			var i = 0;
			var next = function(fade){
				li.eq(i).fadeOut(fade).next().fadeIn(fade);
				page.children('li').eq(i).removeClass('on').next().addClass('on');
				i++;
				if (i>li.length-1) {
					i=0;
					li.eq(i).fadeIn(fade);
					page.children('li').eq(i).addClass('on');
				}
			};
			var prev = function(fade){
				console.log(li.length);

				if (i==0) {
					i=li.length-1;
					li.eq(0).fadeOut(fade);
					li.eq(i).fadeIn(fade);
					page.children('li').eq(0).removeClass('on');
					page.children('li').eq(i).addClass('on');
				}else{
					li.eq(i).fadeOut(fade).prev().fadeIn(fade);
					page.children('li').eq(i).removeClass('on').prev().addClass('on');
					i--;
				}
			}
			//下一张
			$('.next').click(function(event) {
				next(init.fade);
			});
			//上一张
			$('.prev').click(function(event) {
				prev(init.fade);
			});
			// 是否自动轮播
			if (init.time!=''&&init.time!=undefined) {
				var timeRun = setInterval(next,init.time);
				//鼠标经过图片
				li.each(function(index, el) {
					$(this).mouseover(function(event) {
						clearInterval(timeRun);
					}).mouseout(function(event) {
						timeRun = setInterval(next,init.time);
					});
				});
			};
			if (init.page!=''&&init.page!=undefined) {
				//点击导航图标
				pageli.each(function(index, el) {
					$(this).click(function(event) {
						console.log(index);
						i=index;
						console.log(i);
						li.eq(i).fadeIn(init.fade).siblings('li').fadeOut(init.fade);
						page.children('li').eq(i).addClass('on').siblings('li').removeClass('on');
					});		
				});
			};
		}//slideFade end
	}
	// 插件中调用
	$.fn.MdsSlideFade = function(opts){
		var inits = new Inits(this,opts);
		return inits.slideFade();
	}

})(jQuery, window, document);