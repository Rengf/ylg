$(document).ready(function(){
	function getUrlParam(id) {
	        var reg = new RegExp("(^|&)" + id + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	        var r = window.location.search.substr(1).match(reg); //匹配目标参数
	        if (r != null) {
	            return unescape(r[2]);
	        };
	        return null; //返回参数值
	    }
	    var id = getUrlParam('id');
		$.ajax({
			url: 'phone/queryphone.do',
	        type: 'get',
	        dataType: 'json',
	        data: {PID:id},
	        success: function(queryphone) {
	        	$('.goodsDetails').append("<div class='goodsDetailsImg'>" +
	                    "<img src='ylg/images/" + queryphone.phone.ppictureBig.substring(12) + "' alt=''>" +
	                    "</div><div class='goodsDetailsMsg'>" +
	                    "<div class='goodsDetailsMsgHeader'>" +
	                    "<h3>" + queryphone.phone.pname + "</h3>" +
	                    "<span>商品编号:<i>1</i></span>" +
	                    "<span>商品价格:<i>￥" + queryphone.phone.pprice + "</i></span>" +
	                    "</div><div class='goodsDetailsMsgBody'>" +
	                    "<span>尺寸：<i>" + queryphone.phone.psize + "</i></span>" +
	                    "<span>上市时间：<i>" + queryphone.phone.psellTime + "</i></span>" +
	                    "</div><div class='goodsDetailsMsgFooter'>" +
	                    "<span>颜色：<i>" + queryphone.phone.pcolour + "</i></span>" +
	                    "<span>品牌：<i>" + queryphone.phone.pbrand + "</i></span>" +
	                    "</div><div class='goodsDetailsMsgNumber'>" +
	                    "<div class='buyNumber'>" +
	                    "<span>购买数量：</span>" +
	                    "<input type='text' value='0'>" +
	                    "<span><i>+</i><i>-</i></span></div>" +
	                    "<div class='stockNumber'>" +
	                    "<span>库存量：" + queryphone.phone.pstock + "</span>" +
	                    "</div></div><div class='goodsDetailsMsgButton'>" +
	                    "<a href=>加入购物车</a>" +
	                    "<a href='./buy" + id + "'>购买</a>" +
	                    "</div></div>" +
	                    "<div class='otherOperation'>" +
	                    "<div class='otherOperationShare'>" +
	                    "<ul><li><a href='" + id + "'><i></i>收藏</a>" +
	                    "</li><li><a href=''><i></i>分享</a>" +
	                    "</li></ul></div><div class='prevGoods'><span>上一个：</span>" +
	                    "<a>小米 max3</a></div>" +
	                    "<div class='nextGoods'><span>下一个：</span><a>华为 p30</a></div></div>")
	        }
		})
})