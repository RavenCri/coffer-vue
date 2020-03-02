<template>
    <div>
        <div style="width: 300px;margin: 0 auto;font-size: 28px;"><i class="el-icon-star-off" style="font-size: 50px;"></i>我的最爱</div>
    <hr/>
        <div class="center">
          
            <div v-for="(item,index) in collectGood" :key="index">
                <div class="card">
                    <span>{{item.name}}</span></br>
                    <img :src="item.image_url" width="150px" height="200px" alt="?" />
                    <div class="OperationArea">
                        <span @click="buyGood(item)"><i class="el-icon-shopping-cart-1" aria-hidden="true"></i>去购买</span>
                    </div>
                </div>
            </div>
            <goodsWindow ref="goodsWindow" />
        </div>
    </div>

</template>

<script>
    import goodsWindow from "@/components/goodsWindow"
    export default {
        data() {
            return {
                collectGood: null
            }
        },
        mounted() {
            this.init();
        },
        methods: {
            init() {
                this.$axios.post("/collect/getCollGood", {
                    vipId: this.$userGlobal.getUserInfo().vipId,
                }, { headers: { 'Content-type': 'application/json;charset=UTF-8' } }).then(res => {
                    let status = res.data.status;
                    if (status === 'success') {
                        this.collectGood = res.data.result;
                        this.collectGood.forEach(e => {
                            console.log(e)
                        })
                    }

                })
            },
            buyGood(good) {
                // query 参数会显示在url里 用 params则不会携带
                this.$router.push({ name: 'index', query: { name: good.name } });
            }
        },
        components:{
            goodsWindow
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