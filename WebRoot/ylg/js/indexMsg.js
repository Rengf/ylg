$(document).ready(function() {
    //获取手机列表
    $.ajax({
            url: 'phone/querypbrand.do',
            type: 'get',
            dataType: 'json',
            data: {},
            success: function(pbrand) {
                for (var i = 0; i < pbrand.length; i++) {
                	$(".siderBarSubMenuPhone").append("<li><a href='goodslist.jsp?brand=" + pbrand[i].pbrand + "&goods_id=1'>" + pbrand[i].pbrand + "</a></li>")
                }
            },
            error: function(err) {
                console.log(err)
            }
        })
        //获取相机列表
    $.ajax({
            url: 'camera/querybrand.do',
            type: 'get',
            dataType: 'json',
            data: {},
            success: function(cbrand) {
                for (var i = 0; i < cbrand.length; i++) {
                	$(".siderBarSubMenuCarema").append("<li><a href='goodslist.jsp?brand=" + cbrand[i].caBrand + "&goods_id=3'>" + cbrand[i].caBrand + "</a></li>")
                }
            },
            error: function() {
                console.log('相机获取失败')
            }
        })
        //获取电脑列表
    $.ajax({
            url: 'computer/querybrand.do',
            type: 'get',
            dataType: 'json',
            data: {},
            success: function(brand) {
                for (var i = 0; i < brand.length; i++) {
                	$(".siderBarSubMenuPc").append("<li><a href='goodslist.jsp?brand=" + brand[i].cbrand + "&goods_id=2'>" + brand[i].cbrand + "</a></li>")
                }
            },
            error: function() {
                console.log('电脑获取失败')
            }
        })
        //获取配件
    $.ajax({
        url: 'other/querypbrand.do',
        type: 'get',
        dataType: 'json',
        data: {},
        success: function(otherList) {
            var siderBarSubMenuOtherList;
            for (var i = 0; i < otherList.length; i++) {
                siderBarSubMenuOtherList = "<li><a href='goodslist.jsp?othername='" + otherList[i].Pcname + ">" + otherList[i].othername + "</a></li>"
                $(".siderBarSubMenuOther").append(siderBarSubMenuOtherList)
            }
        },
        error: function() {
            console.log('配件获取失败')
        }
    })
    
  //获取手机列表
    $.ajax({
        url: 'phone/list.do',
        type: 'get',
        dataType: 'json',
        data: {},
        success: function(list) {
            for (var i = 0; i < list.length; i++) {
                if (i == 0) {
                    $(".phoneBody").append("<div class='newPhone'>" +
                        "<div class='newPhoneImg'>" +
                        "<img src='ylg/images/" + list[i].ppictureBig.substring(12) + "'alt=''>" +
                        "</div><div class = 'phoneName'>" +
                        "<span> " + list[i].pname + " </span></div>" +
                        "<div class = 'buttonBuy'><span> ￥" + list[i].pprice + "" +
                        "</span>" +
                        "<a href = './goodsdetails.jsp?id=" + list[i].pid + "'> 购买 </a></div></div>")
                } else if (i > 0 && i <= 4) {
                    $(".phoneFooter").append("<div class='phoneListbox'>" +
                        "<div class=phoneList><div class='newPhoneImg'>" +
                        "<img src='ylg/images/" + list[i].ppictureBig.substring(12) + "' alt=''>" +
                        "</div><div class='phoneName'>" +
                        "<span>" + list[i].pname + "</span>" +
                        "</div><div class='buttonBuy'>" +
                        "<span>￥" + list[i].pprice + "</span>" +
                        "<a href='./goodsdetails.jsp?id=" + list[i].pid + "'>购买</a>" +
                        "</div></div></div>")
                } else {
                    $(".phoneFooter").append("");
                }
            }
        },
        error: function() {
            console.log('手机列表获取失败')
        }
    })
    
    //获取相机列表
    $.ajax({
        url: 'camera/list.do',
        type: 'get',
        dataType: 'json',
        data: {},
        success: function(list) {
            for (var i = 0; i < list.length; i++) {
                if (i == 0) {
                    $(".newCameraLeft").append("<div class='newCameraImg'>"+
                                    "<img src='ylg/images/"+list[i].caProduce.substring(12)+"' alt=''>"+
                                "</div><div class='cameraName'>"+
                                    "<span>"+list[i].caName+"</span>"+
                                "</div><div class='buttonBuyCamera'>"+
                                    "<span>￥"+list[i].caPrice+"</span>"+
                                    "<hr align='left'>"+
                                    "<a href='./goodsdetails.jsp?id="+list[i].caID+"'>购买</a>"+
                                "</div>")
                } else if (i ==1) {
                    $(".newCameraRight").append("<div class='newCameraImg'>"+
                            "<img src='ylg/images/"+list[i].caProduce.substring(12)+"' alt=''>"+
                            "</div><div class='cameraName'>"+
                                "<span>"+list[i].caName+"</span>"+
                            "</div><div class='buttonBuyCamera'>"+
                                "<span>￥"+list[i].caPrice+"</span>"+
                                "<hr align='left'>"+
                                "<a href='./goodsdetails.jsp?id="+list[i].caID+"'>购买</a>"+
                            "</div>")
                } else if(i>1&&i<6){
                	$(".cameraFooter").append("<div class='cameraBox'>"+
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
                	 $(".phoneFooter").append("");
                }
            }
        },
        error: function() {
            console.log('相机列表获取失败')
        }
    })

    
    //获取电脑列表
    $.ajax({
        url: 'computer/list.do',
        type: 'get',
        dataType: 'json',
        data: {},
        success: function(list) {
            for (var i = 0; i<list.length; i++) {
            	if (i==0) {
                    $(".newPc").append("<div class='newPcImg'>"+
                            "<img src='ylg/images/"+list[i].cpbase.substring(12)+"' alt=''>"+
                            "</div><div class='pcName'>"+
                            "<span>" + list[i].cname + "</span>"+
                            "</div><div class='buttonBuyPc'>"+
                            "<span>￥" + list[i].cprice + "</span>"+
                            "<hr align='left'>"+
                             "<a href='./goodsdetail.jsp?id="+ list[i].cid +"'>购买</a></div>")
                } else if (i>=1&&i<= 4) {
                    $(".pcFooter").append("<div class='phoneListbox'>" +
	                        "<div class=phoneList><div class='newPhoneImg'>" +
	                        "<img src='ylg/images/" + list[i].cpbase.substring(12) + "' alt=''>" +
	                        "</div><div class='phoneName'>" +
	                        "<span>" + list[i].cname + "</span>" +
	                        "</div><div class='buttonBuy'>" +
	                        "<span>￥" + list[i].cprice + "</span>" +
	                        "<a href='./goodsdetails.jsp?id=" + list[i].cid + "'>购买</a>" +
	                        "</div></div></div>")
                } else {
                    $(".phoneFooter").append("");
                }
            }
        },
        error: function() {
            console.log('手机列表获取失败')
        }
    })
})