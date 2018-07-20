function getUrlParam(brand) {
    var reg = new RegExp("(^|&)" + brand + "=([^&]*)(&|$)", "i"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg); //匹配目标参数
    if (r != null) {
        return decodeURI(r[2]);
    };
    return null; //返回参数值
}
$(document).ready(function() {
    //获取商品列表

    var brand = getUrlParam('brand');
    var goods_id = getUrlParam('goods_id')
    console.log(brand, goods_id)
    var url, category;
    if (goods_id == "1") {
        url = "phone/list.do";
        category = "手机";
    } else if (goods_id == 2) {
        url = "computer/list.do"
        category = "电脑";
    } else {
        url = "camera/list.do";
        category = "相机";
    }
    var newlist = [];
    console.log(url, goods_id)
    $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
        data: {},
        success: function(list) {
             $('.phoneCategory').find('h3').html("<h3>" + category + "类</h3>");
            if (goods_id == "1") {
            	 for (var j = 0; j < list.length; j++) {
                     if (list[j].pbrand == brand) {
                         newlist.push(list[j])
                     }
                 }
                for (var i = 0; i < newlist.length; i++) {
                    if (i < 4) {
                        $(".phonesNewList").append("<div class='phoneListbox'>" +
                            "<div class=phoneList><div class='newPhoneImg'>" +
                            "<img src='ylg/images/" + newlist[i].ppictureBig.substring(12) + "' alt=''>" +
                            "</div><div class='phoneName'>" +
                            "<span>" + newlist[i].pname + "</span>" +
                            "</div><div class='buttonBuy'>" +
                            "<span>￥" + newlist[i].pprice + "</span>" +
                            "<a href='./goodsdetails.jsp?id=" + newlist[i].pid + "'>购买</a>" +
                            "</div></div></div>")
                    } else {
                        $(".phonesList").append("<div class='phoneListbox'>" +
                            "<div class=phoneList><div class='newPhoneImg'>" +
                            "<img src='ylg/images/" + newlist[i].ppictureBig.substring(12) + "' alt=''>" +
                            "</div><div class='phoneName'>" +
                            "<span>" + newlist[i].pname + "</span>" +
                            "</div><div class='buttonBuy'>" +
                            "<span>￥" + newlist[i].pprice + "</span>" +
                            "<a href='./goodsdetails.jsp?id=" + newlist[i].pid + "'>购买</a>" +
                            "</div></div></div>")
                    }
                }
            } else if (goods_id == 2) {
            	 for (var j = 0; j < list.length; j++) {
                     if (list[j].cbrand == brand) {
                         newlist.push(list[j])
                     }
                 }
                for (var i = 0; i < newlist.length; i++) {
                    if (i < 4) {
                        $(".phonesNewList").append("<div class='pcListbox'>" +
                            "<div class='pcList'>" +
                            "<div class='newPcImg'>" +
                            "<img src='ylg/images/" + newlist[i].cpbase.substring(12) + "' alt=''>" +
                            "</div><div class='pcName'>" +
                            "<span>" + newlist[i].cname + "</span>" +
                            "</div><div class='buttonBuyPc'>" +
                            "<span>￥" + newlist[i].cprice + "</span>" +
                            "<hr align='left'>" +
                            "<a href='./goodsdetails.jsp?id=" + newlist[i].cid + "'>购买</a>" +
                            "</div></div></div>")
                    } else {
                        $(".phonesList").append("<div class='pcListbox'>" +
                            "<div class='pcList'>" +
                            "<div class='newPcImg'>" +
                            "<img src='ylg/images/" + newlist[i].cpbase + "' alt=''>" +
                            "</div><div class='pcName'>" +
                            "<span>" + newlist[i].cname + "</span>" +
                            "</div><div class='buttonBuyPc'>" +
                            "<span>￥" + newlist[i].cprice + "</span>" +
                            "<hr align='left'>" +
                            "<a href='./goodsdetails.jsp?id=" + newlist[i].cid + "'>购买</a>" +
                            "</div></div></div>")
                    }

                }
            } else {
            	 for (var j = 0; j < list.length; j++) {
                     if (list[j].caBrand == brand) {
                         newlist.push(list[j])
                     }
                 }
            	 console.log(newlist)
            	 for (var i = 0; i < newlist.length; i++) {
                    if (i < 4) {
                        $(".phonesNewList").append("<div class='cameraBox'>" +
                            "<div class='newCameraList'>" +
                            "<div class='newCameraImg'>" +
                            "<img src='ylg/images/" + newlist[i].caProduce.substring(12) + "' alt=''>" +
                            "</div><div class='cameraName'>" +
                            "<span>" + newlist[i].caName + "</span></div>" +
                            "<div class='buttonBuyCamera'>" +
                            "<span>￥" + newlist[i].caPrice + "</span>" +
                            "<hr align='left'>" +
                            "<a href='./goodsdetails.jsp?id=" + newlist[i].caID + "'>购买</a>" +
                            "</div></div></div>")
                    } else {
                        $(".phonesList").append("<div class='cameraBox'>" +
                            "<div class='newCameraList'>" +
                            "<div class='newCameraImg'>" +
                            "<img src='ylg/images/" + newlist[i].caProduce.substring(12) + "' alt=''>" +
                            "</div><div class='cameraName'>" +
                            "<span>" + newlist[i].caName + "</span></div>" +
                            "<div class='buttonBuyCamera'>" +
                            "<span>￥" + newlist[i].caPrice + "</span>" +
                            "<hr align='left'>" +
                            "<a href='./goodsdetails.jsp?id=" + newlist[i].caID + "'>购买</a>" +
                            "</div></div></div>")
                    }
            	 }
                }
            },
        error: function() {
            console.log('手机列表获取失败')
        }
    })
})