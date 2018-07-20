$(document).ready(function() {
	
		//获取商品列表
		function getUrlParam(goods_id) {
	        var reg = new RegExp("(^|&)" + goods_id + "=([^&]*)(&|$)","i"); //构造一个含有目标参数的正则表达式对象
	        var r = window.location.search.substr(1).match(reg); //匹配目标参数
	        if (r != null) {
	            return unescape(r[2]);
	        };
	        return null; //返回参数值
	    }
	    var goods_id = getUrlParam('goods_id');
	    var brand = getUrlParam('brand');
	    if(brand==''||brand==null){
	    var url,category;
	    if(goods_id==1){
	    	url="phone/list.do";
	    	category="手机";
	    }else if(goods_id==2){
	    	url="computer/list.do"
	    		category="电脑";
	    }else{
	    	url="camera/list.do";
	    	category="相机";
	    }
	    console.log(url);
	    $.ajax({
	        url: url,
	        type: 'get',
	        dataType: 'json',
	        data: {},
	        success: function(list) {
	        	$('.phoneCategory').find('h3').html("<h3>"+category+"类</h3>");
	        	if(goods_id==1){
	            for (var i = 0; i < list.length; i++) {
	                if (i <4) {
	                    $(".phonesNewList").append("<div class='phoneListbox'>" +
		                        "<div class=phoneList><div class='newPhoneImg'>" +
		                        "<img src='ylg/images/" + list[i].ppictureBig.substring(12) + "' alt=''>" +
		                        "</div><div class='phoneName'>" +
		                        "<span>" + list[i].pname + "</span>" +
		                        "</div><div class='buttonBuy'>" +
		                        "<span>￥" + list[i].pprice + "</span>" +
		                        "<a href='./goodsdetails.jsp?id=" + list[i].pid + "'>购买</a>" +
		                        "</div></div></div>")
	                } else{
	                    $(".phonesList").append("<div class='phoneListbox'>" +
	                        "<div class=phoneList><div class='newPhoneImg'>" +
	                        "<img src='ylg/images/" + list[i].ppictureBig.substring(12) + "' alt=''>" +
	                        "</div><div class='phoneName'>" +
	                        "<span>" + list[i].pname + "</span>" +
	                        "</div><div class='buttonBuy'>" +
	                        "<span>￥" + list[i].pprice + "</span>" +
	                        "<a href='./goodsdetails.jsp?id=" + list[i].pid + "'>购买</a>" +
	                        "</div></div></div>")
	                } 
	            }
	        	}else if(goods_id==2){
	        		for (var i = 0; i < list.length; i++) {
		                if (i <4) {
			        		$(".phonesNewList").append("<div class='pcListbox'>"+
		                            "<div class='pcList'>"+
		                            "<div class='newPcImg'>"+
		                            "<img src='ylg/images/"+list[i].cpbase.substring(12)+"' alt=''>"+
		                            "</div><div class='pcName'>"+
		                            "<span>"+list[i].cname+"</span>"+
		                            "</div><div class='buttonBuyPc'>"+
		                            "<span>￥"+list[i].cprice+"</span>"+
		                            "<hr align='left'>"+
		                            "<a href='./goodsdetails.jsp?id="+list[i].cid+"'>购买</a>"+
		                            "</div></div></div>")
		                }else{
		                	 $(".phonesList").append("<div class='pcListbox'>"+
					                "<div class='pcList'>"+
					                "<div class='newPcImg'>"+
					                "<img src='ylg/images/"+list[i].cpbase+"' alt=''>"+
					                "</div><div class='pcName'>"+
					                "<span>"+list[i].cname+"</span>"+
					                "</div><div class='buttonBuyPc'>"+
					                "<span>￥"+list[i].cprice+"</span>"+
					                "<hr align='left'>"+
					                "<a href='./goodsdetails.jsp?id="+list[i].cid+"'>购买</a>"+
					                "</div></div></div>")
		                	}
		                
		                }
	        	}else{
	        		for (var i = 0; i < list.length; i++) {
		                if (i <4) {
		                	$(".phonesNewList").append("<div class='cameraBox'>"+
                            "<div class='newCameraList'>"+
                                "<div class='newCameraImg'>"+
                                    "<img src='ylg/images/"+list[i].caProduce.substring(12)+"' alt=''>"+
                                "</div><div class='cameraName'>"+
                                    "<span>"+list[i].caName+"</span></div>"+
                                "<div class='buttonBuyCamera'>"+
                                    "<span>￥"+list[i].caPrice+"</span>"+
                                    "<hr align='left'>"+
                                    "<a href='./goodsdetails.jsp?id="+list[i].caID+"'>购买</a>"+
                                "</div></div></div>")
		                	}else{
		                		$(".phonesList").append("<div class='cameraBox'>"+
		                                "<div class='newCameraList'>"+
		                                    "<div class='newCameraImg'>"+
		                                        "<img src='ylg/images/"+list[i].caProduce.substring(12)+"' alt=''>"+
		                                    "</div><div class='cameraName'>"+
		                                        "<span>"+list[i].caName+"</span></div>"+
		                                    "<div class='buttonBuyCamera'>"+
		                                        "<span>￥"+list[i].caPrice+"</span>"+
		                                        "<hr align='left'>"+
		                                        "<a href='./goodsdetails.jsp?id="+list[i].caID+"'>购买</a>"+
		                                    "</div></div></div>")
		                	}
		                }
	        	}
	        },
	        error: function() {
	            console.log('手机列表获取失败')
	        }
	    })
	    }
})