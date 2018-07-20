$(document).ready(function(){
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
})