<template>
    <div>
        <div class="title"><i class="el-icon-position"></i>我的消费记录</div>
        <el-table :data="myorder" style="width: 100%">
            <el-table-column label="下单时间" width="250">
                <template slot-scope="scope">
                    <i class="el-icon-time"></i>
                    <span style="margin-left: 10px">{{ scope.row.createdTime}}</span>
                </template>
            </el-table-column>
            <el-table-column label="商品名" width="180">
                <template slot-scope="scope">
                    <el-tag size="medium">{{
                        scope.row.goodName
              }}</el-tag>
                  

                </template>
            </el-table-column>
            <el-table-column label="商品规格" width="180">
                <template slot-scope="scope">
                    <el-tag size="medium">{{
                        scope.row.goodNess
              }}</el-tag>
                    <el-tag size="medium">{{
                        scope.row.cupType
              }}</el-tag>

                </template>
            </el-table-column>
            <el-table-column label="数量" width="180">
                <template slot-scope="scope">
                    <div class="num">

                        <span style="width:30px;display:inline-block;text-align:center">
                            {{ scope.row.good_num }}杯
                        </span>

                    </div>

                </template>
            </el-table-column>
            <el-table-column label="付款金额">
                <template slot-scope="scope">
                    <el-tag size="medium">{{scope.row.fmoney}}元</el-tag>


                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
    export default {
        mounted() {
            this.init();
        },
        methods: {
            init() {
                this.$axios.post("/order/selectOrderByVipId", {
                    vipId: this.$userGlobal.getUserInfo().vipId
                }, { headers: { 'Content-type': 'application/json;charset=UTF-8' } }).then(res => {
                    console.log(res.data)
                    this.myorder = res.data;
                })
            }
        },
        data() {
            return {
                myorder: null
            }
        }

    }
</script>

<style scoped>
    .title {
        text-align: center;
        margin: 10px auto 20px;
        font-size: 28px;
    }
</style>