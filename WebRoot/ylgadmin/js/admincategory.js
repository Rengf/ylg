function getUrlParam(brand) {
    var reg = new RegExp("(^|&)" + brand + "=([^&]*)(&|$)", "i"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg); //匹配目标参数
    if (r != null) {
        return decodeURI(r[2]);
    };
    return null; //返回参数值
}
$(document).ready(function() {
	 var category = getUrlParam('category');
	 var url,goods_id;
	    if (category =="手机") {
	    	goods_id=1;
	        url = "phone/list.do";
	    }else if (category =="电脑") {
	    	goods_id=2;
	        url = "computer/list.do"
	    } else {
	        url = "camera/list.do";
	    }
	    $.ajax({
	        url: url,
	        type: 'get',
	        dataType: 'json',
	        data: {},
	        success: function(list) {
	        	console.log(list)
	    	    if(goods_id ==list[0].goods_id){
	        	for (var i = 0; i < list.length; i++) {
	                var j = i + 1;
	                $(".goodslist").append("<tr>" +
	                    "<td><input type='checkbox' /></td>" +
	                    "<td>" + j + "</td>" +
	                    "<td>" + list[i].pname + "</td>" +
	                    "<td>" + list[i].pprice + "</td>" +
	                    "<td>" + list[i].pbrand + "</td>" +
	                    "<td>" + list[i].pcolour + "</td>" +
	                    "<td>" + list[i].psize + "</td>" +
	                    "<td>" + list[i].psellTime + "</td>" +
	                    "<td>" + list[i].pstock + "</td>" +
	                    "<td><div class='am-btn-toolbar'>" +
	                    "<div class='am-btn-group am-btn-group-xs'>" +
	                    "<button class='am-btn am-btn-default am-btn-xs am-text-success am-round'>" +
	                    "<a class='am-icon-search' title='查看详情' href='./goodslist.jsp?id=" + list[i].pid + "'></a> </button>" +
	                    "<button class='am-btn am-btn-default am-btn-xs am-text-secondary am-round'>" +
	                    "<a class='am-icon-pencil-square-o' title='修改'  href='./adminaddgoods.jsp?id=" + list[i].pid + "'></a></button>" +
	                    "<button class='am-btn am-btn-default am-btn-xs am-text-danger am-round'>" +
	                    "<a class='am-icon-trash-o " + list[i].pid + "' id='delete' title='删除' '></a></button>" +
	                    "</div></div></td></tr>")
	        	}
	    	    }else if(list[0].goods_id==goods_id){
	    	    	for (var i = 0; i < list.length; i++) {
		                var j = i + 1;
		                $(".goodslist").append("<tr>" +
		                    "<td><input type='checkbox' /></td>" +
		                    "<td>" + j + "</td>" +
		                    "<td>" + list[i].cname + "</td>" +
		                    "<td>" + list[i].cprice + "</td>" +
		                    "<td>" + list[i].cbrand + "</td>" +
		                    "<td>" + list[i].ccolour + "</td>" +
		                    "<td>" + list[i].csize + "</td>" +
		                    "<td>" + list[i].csellTime + "</td>" +
		                    "<td>" + list[i].cstock + "</td>" +
		                    "<td><div class='am-btn-toolbar'>" +
		                    "<div class='am-btn-group am-btn-group-xs'>" +
		                    "<button class='am-btn am-btn-default am-btn-xs am-text-success am-round'>" +
		                    "<a class='am-icon-search' title='查看详情' href='./goodslist.jsp?id=" + list[i].cid + "'></a> </button>" +
		                    "<button class='am-btn am-btn-default am-btn-xs am-text-secondary am-round'>" +
		                    "<a class='am-icon-pencil-square-o' title='修改'  href='./goodslist.jsp?id=" + list[i].cid + "'></a></button>" +
		                    "<button class='am-btn am-btn-default am-btn-xs am-text-danger am-round'>" +
		                    "<a class='am-icon-trash-o " + list[i].pid + "' id='delete' title='删除'  href='./goodslist.jsp?id=" + list[i].cid + "'></a></button>" +
		                    "</div></div></td></tr>")
	    	    }
	    	    }
	    	    else{
	    	    	for (var i = 0; i < list.length; i++) {
		                var j = i + 1;
		                $(".goodslist").append("<tr>" +
		                    "<td><input type='checkbox' /></td>" +
		                    "<td>" + j + "</td>" +
		                    "<td>" + list[i].caName + "</td>" +
		                    "<td>" + list[i].caPrice + "</td>" +
		                    "<td>" + list[i].caBrand + "</td>" +
		                    "<td>无</td>" +
		                    "<td>" + list[i].caSize + "</td>" +
		                    "<td>" + list[i].caTimeToMarket + "</td>" +
		                    "<td>" + list[i].caStock + "</td>" +
		                    "<td><div class='am-btn-toolbar'>" +
		                    "<div class='am-btn-group am-btn-group-xs'>" +
		                    "<button class='am-btn am-btn-default am-btn-xs am-text-success am-round'>" +
		                    "<a class='am-icon-search' title='查看详情' href='./goodslist.jsp?id=" + list[i].caID + "'></a> </button>" +
		                    "<button class='am-btn am-btn-default am-btn-xs am-text-secondary am-round'>" +
		                    "<a class='am-icon-pencil-square-o' title='修改'  href='./goodslist.jsp?id=" + list[i].caID + "'></a></button>" +
		                    "<button class='am-btn am-btn-default am-btn-xs am-text-danger am-round'>" +
		                    "<a class='am-icon-trash-o " + list[i].pid + "' id='delete' title='删除'  href='./goodslist.jsp?id=" + list[i].caID + "'></a></button>" +
		                    "</div></div></td></tr>")
	    	    }
	    	    }
	            },
	            error:function(){
	            	console.log('获取失败')
	            }
	       
	    })
	    
	    $("#delete").click(function(){
	    	console.log($(".delete").attr())
	    })
})