layui.use('table', ()=>{
    var socket;
    if(typeof(WebSocket) == "undefined") {
        console.log("您的浏览器不支持WebSocket");
    }else{
        console.log("您的浏览器支持WebSocket");

        //实现化WebSocket对象，指定要连接的服务器地址与端口  建立连接
        socket = new WebSocket("ws://127.0.0.1/ws/order");
        //打开事件
        socket.onopen = function() {
            console.log("Socket 已打开");
        };
        //获得消息事件
        socket.onmessage = function(msg) {
            let data = JSON.parse(msg.data)
           // console.log("websocket-->"+JSON.stringify(data));
            if(data['msgType']==='newOrder'){
                hasOrder(JSON.parse(data.data))
            }else if(data['msgType']==='newOrders'){
                hasOrders()
            }

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

})
