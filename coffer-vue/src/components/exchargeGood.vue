<template>
    <div class="center">
        <div v-for="(item,index) in excharge" :key="index">
            <div class="card">
                <span>{{item.name}}</span></br>
                <span><sup></sup>{{item.needIntegral}}积分</span>
                <img :src="item.imageUrl" width="150px" height="200px" alt="?" />
                <div class="OperationArea">
                    <span @click="exchargeGood(item)"><i class="el-icon-shopping-cart-1"
                            aria-hidden="true"></i>兑换</span>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    export default {
        mounted() {
            this.logined = this.$userGlobal.alreadyLogin();
        },
        methods: {
            randomString(len) {
               
               len = len || 32;
               var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
               var maxPos = $chars.length;
               var pwd = '';
               for (i = 0; i < len; i++) {
                   pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
               }
               return pwd;
           },
            exchargeGood(item) {

                if (this.logined) {
                    // 后台获取积分 判断积分是否足够
                    let jf = 5000;
                    if (jf > item.needIntegral) {
                        this.$confirm('您确定消费' + item.needIntegral + '点积分兑换' + item.name + "吗？", '提示', {
                            confirmButtonText: '确定',
                            cancelButtonText: '取消',
                            type: 'warning'
                        }).then(() => {
                            return this.randomString(32)
                        }).then(() => {
                            console.log("进来")
                            this.$message({
                                message: "兑换成功，你可凭取此号码去前台兑换。请妥善保存。" ,
                                type: "success"
                            });

                        }).catch(() => {

                        })
                    } else {
                        this.$message({
                            message: "您当前的积分为：" + jf + "点，兑换还差" + (item.needIntegral - jf) + "点哦，充值和签到都可以获取积分哦~",
                            type: "warning"
                        });
                    }

                } else {
                    this.$confirm('您还未登陆，是否需要登录?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        this.$router.push({ name: 'login', params: { redirect: "/shoppingCar" } });
                    }).catch(() => {

                    })
                }
            },
           
        },
        data() {
            return {
                logined: false,
                excharge: [
                    {
                        name: "精致马克杯",
                        needIntegral: 1500,
                        imageUrl: require("../assets/images/mkb.jpg")
                    },
                    {
                        name: "女士吸管杯",
                        needIntegral: 2000,
                        imageUrl: require("../assets/images/nsxgb.jpg")
                    },
                    {
                        name: "星巴克纪念版随行杯",
                        needIntegral: 5000,
                        imageUrl: require("../assets/images/sxb.jpg")
                    }
                ]
            }
        }
    }
</script>

<style scoped>
    .center {
        width: 60%;
        margin: 20px auto 30px;
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        position: relative;
    }

    .card {
        text-align: center;
        width: 200px;
        border: 2px solid rgba(255, 255, 244, 0.5);
        padding: 20px;
        margin-top: 30px;
        background: linear-gradient(-45deg, #ffec61, #f321d7);
        border-radius: 20px;
        /* box-shadow:1px 0  10px #000 inset; */
        user-select: none;
        /* border: 1px solid slateblue; */
    }

    .card div {}

    .card div span:nth-child(1) {
        background-color: black;
        color: white;
        cursor: pointer;
        border-radius: 15%;
        padding: 10px 20px;
        display: inline-block;
        margin-top: 20px;
    }
</style>