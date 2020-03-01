<template>
    <div class="content">
        <el-dialog title="扫码支付" :visible.sync="centerDialogVisible" :show-close=false :close-on-press-escape=false
            @open="stop" @close="move" :lock-scroll=true :close-on-click-modal=false width="25%" center>
            <p style="text-align: center;font-size: 20px;color: blueviolet;">请您扫码支付：{{money}} 元</p>
            <img style="width:200px;display: block; margin:10px auto" src="../assets/images/zfb.jpg" alt="">
            <span slot="footer" class="dialog-footer">

                <el-button type="primary" @click="cancelOrder">{{cancelBut}}</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
    export default {
        mounted() {

        },
        data() {
            return {
                money: 0,
                centerDialogVisible: false,
                canncelMsg: "",
                cancelBut: "",
                currOrderIdAll: null,
                Interval:null
            }
        },
        methods: {
            cancelOrder() {
                this.$confirm(this.canncelMsg, '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.centerDialogVisible = false;
                    clearInterval(this.Interval);
                    this.$axios.post("/order/cancelOrder", {
                        param: this.currOrderIdAll
                    }, {
                        headers: {
                            'Content-type': 'application/json;charset=UTF-8'
                        }
                    }).then(response => {
                        console.log(response);
                        let type;
                        let message;
                        if (response.data.status === "status") {
                            type = "success"; message = "已取消订单";
                        } else {
                            type = "error"; message = response.data.msg;
                        }
                        this.$message({
                            type: 'success',
                            message: '已取消该订单'
                        });
                    }).catch(function (error) {
                        console.log(error);
                    });


                }).catch(() => {

                });
            },
            stop() {
                var mo = function (e) { e.preventDefault(); };
                document.body.style.overflow = 'hidden';
                document.addEventListener("touchmove", mo, { passive: false });//禁止页面滑动
            },
            move() {
                var mo = function (e) { e.preventDefault(); };
                document.body.style.overflow = '';//出现滚动条
                document.removeEventListener("touchmove", mo, { passive: false });
            },
            addPay(param) {
                this.$axios.post("/order/addPay", {
                    param
                }, {
                    headers: {
                        'Content-type': 'application/json;charset=UTF-8'
                    }
                }).then(response => {
                    // 后续处理
                    this.orderRuturnHandle(response);
                }).catch(function (error) {
                    console.log(error);
                });
            },
            addPays(param) {

                this.$axios.post("/order/addPays", {
                    param: param
                }, {
                    headers: {
                        'Content-type': 'application/json;charset=UTF-8'
                    }
                }).then(response => {
                    console.log(response);
                    this.orderRuturnHandle(response);
                    let flag = this.$userGlobal.alreadyLogin();
                    // 登陆且支付成功了
                    if (flag && response.data.status === "success") {
                        // 把购物车的数据删除掉
                        this.$parent.shoppingCar.splice(0, this.$parent.shoppingCar.length);
                        this.$parent.vipMoney = 0;
                        this.$parent.totalMoney = 0;
                        this.$shoppingCar.setShoppringCar(this.$parent.shoppingCar);
                    }



                }).catch(function (error) {
                    console.log(error);
                });
            },//充值金额
            addMoneyOrder() {

            },
            flushVipInfo() {
                var user = this.$userGlobal.getUserInfo();

                this.$axios.post("/vip/login", {
                    vipId: user.vipId
                }, { headers: { 'Content-type': 'application/json;charset=UTF-8' } }).then(res => {
                    let info = res.data.message;
                    this.$userGlobal.setUserInfo(JSON.parse(info));
                })

            },
            orderRuturnHandle(response) {
                console.log(response);
                this.currOrderIdAll = response.data.result;
                let status = response.data.status;
                if (status && this.$userGlobal.alreadyLogin()) {
                    this.flushVipInfo();
                }
                let flag = this.$userGlobal.alreadyLogin();
                if (flag && status === "success") {
                    this.$alert("下单成功了，请牢记您的取货号：" + response.data.takeGoodIndex + ",请及时去前台取餐哦", '购买成功', {
                        confirmButtonText: '确定',
                    });
                    return;
                } else if (status === "error") {
                    this.$alert("下单失败了，错误信息：" + response.data.msg, '下单失败', {
                        confirmButtonText: '确定',
                    });
                    return;
                }
                //检测订单状态
                this.getOrderStatus();
            },
            getOrderStatus() {


                this.currOrderIdAll.forEach(e => {
                    //console.log(e);
                    this.Interval = setInterval(() => {

                        this.$axios.get("/order/getOrderStatus/" + e, {
                            headers: {
                                'Content-type': 'application/json;charset=UTF-8'
                            }
                        }).then(res => {
                            console.log(res.data.status);
                            if (res.data.status == 1) {
                                this.centerDialogVisible = true;
                                this.$alert("付款成功了，请牢记您的取货号：" + res.data.takeGoodIndex + ",请及时去前台取餐哦", '付款成功', {
                                    confirmButtonText: '确定',
                                });
                            }
                        }).catch(err => {

                        })
                    }, 2000);
                })
            }
        }

    }
</script>

<style scoped>
    /* .content {
        text-align: center;
    } */
</style>