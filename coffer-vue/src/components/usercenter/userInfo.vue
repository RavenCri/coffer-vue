<template>
  <div>

    <div class="content" style="width: 100%;">


      <el-collapse accordion>
        <el-collapse-item>
          <template slot="title">
            会员状态<i class="header-icon el-icon-info"></i>
          </template>
          <div style="font-size: 18px;">
            <span style="color: forestgreen;"><i class="el-icon-position"></i>余额：500元</span></br>
            <span style="color: indianred;"><i class="el-icon-star-off"></i>积分：{{integral}}</span></br>
            <span style="color: lightgreen;"><i class="el-icon-medal-1"></i>会员等级：V7</span></br>
            <div style="width: 200px;margin: 0 auto;">
              <span>v7<el-progress :text-inside="true" :stroke-width="20" :width="5" :percentage="70"></el-progress>
                v8</span></br>
            </div>
          </div>
          <el-button type="warning" icon="el-icon-star-off" plain @click="addMoney">充值</el-button>
          <el-button type="warning" plain><i class="el-icon-s-opportunity" @click="addIntegral"></i>签到</el-button>
          <el-button type="warning" plain><i class="el-icon-present" @click="addIntegral"></i>兑换礼品</el-button>

        </el-collapse-item>
        <el-collapse-item title="常用住址">
          <div><i class="el-icon-headset"></i>厦门市鼓浪屿沿海小岛</div>

        </el-collapse-item>
        <el-collapse-item title="尊享服务">
          <span><i class="el-icon-s-opportunity"></i>消费：88折</span></br>
          <span><i class="el-icon-help"></i>免费休息室</span></br>
        </el-collapse-item>

      </el-collapse>
    </div>
    <payWindow ref="payWindow" />
  </div>

</template>

<script>
  import payWindow from "@/components/payWindow";
  export default {
    components: {
      payWindow
    },
    data() {
      return {
        integral: 500
      }
    },
    methods: {
      addMoney() {
        this.$prompt('请输入你的充值金额', '输入金额', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputPattern: /^(([1-9]\d+\.[0-9])|([1-9]\d+))$/,
          inputErrorMessage: '请输入正确的金额（最低充值10元且最多只能一个小数位）'
        }).then(({ value }) => {
          this.$refs.payWindow.money = value;
          this.$refs.payWindow.canncelMsg = "确定取消充值吗？";
          this.$refs.payWindow.cancelBut = "取消充值";
          this.$refs.payWindow.centerDialogVisible = true;
        }).catch(() => {

        });

      },
      addIntegral() {
        this.integral += 20;
        this.$message({
          message: "您已签到成功，本次签到积分+20",
          type: "success"
        })
      }
    }

  }
</script>

<style scoped>
  .content {
    width: 40%;
    text-align: center;
  }
</style>