$(document).ready(function() {

    //获取用户
    $.ajax({
        url: '',
        type: 'get',
        datatype: 'json',
        data: {},
        success: function(list) {
            for (var i = 0; i < list.length; i++) {
                var j = i + 1;
                $(".userList").append("<tr> <td > < input type = 'checkbox' / > < /td>" +
                    "<td>" + j + "< /td>" +
                    "<td>" + list[i].user_name + "</td >" +
                    "<td >" + list[i].user_type + "< /td>" +
                    "<td class = 'am-hide-sm-only' >" + list[i].email + " < /td>" +
                    "<td class = 'am-hide-sm-only' >" + list[i].tel + " < /td>" +
                    "<td class = 'am-hide-sm-only' >" + list[i].creattime + " < /td>" +
                    "<td><div class = 'am-btn-toolbar'><div class = 'am-btn-group am-btn-group-xs'>" +
                    "<button class = 'am-btn am-btn-default am-btn-xs am-text-success am-round' > " +
                    "< a class = 'am-icon-search' title = '查看用户' href=' ./usermessage.html?=" + list[i].user_id + "'></a> </button >" +
                    "<button class ='am-btn am-btn-default am-btn-xs am-text-secondary am-round' >" +
                    "< a class = 'am-icon-pencil-square-o' href=' ./useredit.html?=" + list[i].user_id + "'></a></button >" +
                    "<button class = 'am-btn am-btn-default am-btn-xs am-text-danger am-round' title = '删除用户' >" +
                    "<a class = 'am-icon-trash-o' href=' ./usermessage.html?=" + list[i].user_id + "'></a></button >" +
                    "</div> </div> </td> </tr>")
            }
        },
        error: function() {
            console.log("获取失败")
        }

    })
})