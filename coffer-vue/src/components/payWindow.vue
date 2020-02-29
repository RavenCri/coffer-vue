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
                cancelBut: ""
            }
        },
        methods: {
            cancelOrder() {
                this.$confirm(this.canncelMsg, '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.centerDialogVisible = false
                    this.$message({
                        type: 'success',
                        message: '已取消支付'
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
                    console.log(response);
                    if (this.$userGlobal.alreadyLogin()) {
                        this.flushVipInfo();

                        this.$alert("您成功购买了" + param.name + ",请及时去前台取餐哦", '购买成功', {
                            confirmButtonText: '确定',

                        });

                    } else {

                    }

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
                    if (this.$userGlobal.alreadyLogin()) {
                        this.flushVipInfo();
                        this.$alert("您已成功付款,请及时去前台取餐哦", '购买成功', {
                            confirmButtonText: '确定',

                        });
                        // 把购物车的数据删除掉
                        this.$parent.shoppingCar.splice(0,this.$parent.shoppingCar.length); 
                        this.$parent.vipMoney = 0;
                        this.$parent.totalMoney = 0;
                        this.$shoppingCar.setShoppringCar(this.$parent.shoppingCar);
                    } else {
                        this.$refs.payWindow.money = this.goods.price[this.goods.cupType];
                        this.$refs.payWindow.canncelMsg = '确定取消订单吗?';
                        this.$refs.payWindow.cancelBut = '取消订单';
                        this.$refs.payWindow.centerDialogVisible = true;
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

            }
        }

    }
</script>

<style scoped>
    /* .content {
        text-align: center;
    } */
</style>