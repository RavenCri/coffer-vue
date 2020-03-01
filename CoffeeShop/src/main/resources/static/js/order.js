
 function getOrderAll(callback){
     $.ajax({
         type: "get",
         url: "/order/getAllOrder",
         async: false,
         success: function (data) {
             console.log(data)
             callback(data)
         },
         error: function (data) {
             console.log(data);
         }
     });

 }
function initTable(data) {
    table.render({
        elem: '#demo'
        , height: 500
        , width: 1000,
        //, url: '/order/getAllOrder' //数据接口
        data:data.data
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'bid', title: '订单ID', sort: true}
            , {field: 'username', title: '购买者',}
            , {field: 'goodName', title: '商品名', width: 120}
            , {field: 'money', title: '金额', width: 100}
            , {field: 'fmoney', title: '优惠后', width: 100}
            , {field: 'goodNess', title: '甜度', width: 100}
            , {field: 'cupType', title: '杯型', width: 100}
            , {field: 'order_status', title: '订单状态',}
            , {toolbar: '#barDemo', width: 150, event: "but"}
        ]], done: function (res, curr, count) {
            $("[data-field = 'good']").children().each(function () {
                if ($(this).text() == '1') {

                    // $(this).text("插件方式");

                } else if ($(this).text() == '0') {

                    // $(this).text("代码方式");

                }

            })
        }, initSort: {
            type: 'desc',
            field: 'bid'
        }, parseData: function (res) { //res 即为原始返回的数据
            return {
                // "code": res.status, //解析接口状态
                // "msg": res.RSP_DESC, //解析提示文本
                // "count": res.rsp.ATTACH.COUNT, //解析数据长度
                "data": res.RSP.DATA //解析数据列表
            };
        }
    });
}
var socket;
if(typeof(WebSocket) == "undefined") {
    console.log("您的浏览器不支持WebSocket");
}else{
    console.log("您的浏览器支持WebSocket");

    //实现化WebSocket对象，指定要连接的服务器地址与端口  建立连接
    socket = new WebSocket("ws://127.0.0.1/websocket");
    //打开事件
    socket.onopen = function() {
        console.log("Socket 已打开");
    };
    //获得消息事件
    socket.onmessage = function(msg) {
        console.log(msg.data);
        layer.msg(msg.data);
        getOrderAll(function(data){
            console.log(data)
            initTable(data)
        });
        //发现消息进入    调后台获取
        //getCallingList();
    };
    //关闭事件
    socket.onclose = function() {
        console.log("Socket已关闭");
    };
    //发生了错误事件
    socket.onerror = function() {
        alert("Socket发生了错误");
    }

    //关闭连接
    function closeWebSocket() {
        socket.close();
    }

    //发送消息
    function send() {
        var message = document.getElementById('text').value;
        socket.send(message);
    }
}
