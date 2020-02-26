<template>
    <div class="content">
        <el-dialog title="扫码支付" :visible.sync="centerDialogVisible" 
        :show-close=false :close-on-press-escape=false
       
        :lock-scroll=true
        :close-on-click-modal=false width="25%" center>
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
        mounted () {
            
        },
        data() {
            return {
                money: 0,
                centerDialogVisible: false,
                canncelMsg:"",
                cancelBut:""
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
            }
        }

    }
</script>

<style scoped>
    /* .content {
        text-align: center;
    } */
</style>