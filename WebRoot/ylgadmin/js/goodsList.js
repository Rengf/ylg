function getUrlParam(brand) {
    var reg = new RegExp("(^|&)" + brand + "=([^&]*)(&|$)", "i"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg); //匹配目标参数
    if (r != null) {
        return decodeURI(r[2]);
    };
    return null; //返回参数值
}
$(document).ready(function() {
    // 获取分类
    $.ajax({
        url: 'goods/list.do',
        type: 'get',
        datatype: 'json',
        data: {},
        success: function(list) {
           for (var i = 0; i <list.length; i++) {
                    $("#listtitle").append("<dl><a href='./admingoodslist.jsp?category="+list[i].goods_category+"' type='button' class='am-btn am-btn-danger am-round am-btn-xs'>" + list[i].goods_category + "列表 </button></dl>")
                }
        },
        error: function() {
            console.log('获取失败')
        }
    })
    var category = getUrlParam('category');
   if(category==''||category==null){
        //获取商品
    $.ajax({
        url: 'phone/list.do',
        type: 'get',
        datatype: 'json',
        data: {},
        success: function(list) {
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
                    "<a class='am-icon-search' title='查看详情' href='./goodslist.jsp?=" + list[i].pid + "'></a> </button>" +
                    "<button class='am-btn am-btn-default am-btn-xs am-text-secondary am-round'>" +
                    "<a class='am-icon-pencil-square-o' title='修改'  href='./goodslist.jsp?=" + list[i].pid + "'></a></button>" +
                    "<button class='am-btn am-btn-default am-btn-xs am-text-danger am-round'>" +
                    "<a class='am-icon-trash-o' title='删除'  href='./goodslist.jsp?=" + list[i].pid + "'></a></button>" +
                    "</div></div></td></tr>")
            }
        },
        error: function() {
            console.log("获取失败")
        }

    })
    
    $('.search').click(function(){
    	var $category=$("#am-selected-8xmsv").find('button').find('span')
    	var x=$category.text();
        console.log(x)
    })
   }
})