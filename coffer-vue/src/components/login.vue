<template>
  <div class="login">
    <div class="lg"><i class="el-icon-user"></i><span> 登  录</span></div>
    <div>
      <el-form
        :model="ruleForm"
        status-icon
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="账号" prop="username">
          <el-input
            type="el-input"
            v-model="ruleForm.username"
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input
            type="password"
            v-model="ruleForm.password"
            autocomplete="off"
          ></el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')"
            >登陆</el-button
          >
          <el-button @click="resetForm('ruleForm')">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    var username = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入账号"));
      } else {
        callback();
      }
    };
    var password = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        callback();
      }
    };
    return {
      ruleForm: {
        username: "",
        password: ""
      },
      rules: {
        username: [{ validator: username, trigger: "blur" }],
        password: [{ validator: password, trigger: "blur" }]
      }
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
           this.setUserInfo(this.ruleForm);
           //this.$router.go(-1);
           window.history.back()
           //this.$router.push({name:'personCenter'});
        } else {
            this.$message({
            message: "登陆失败",
            type: "success"
          });
          return false;
        }
      });
    },
    setUserInfo(user){
        this.$userGlobal.setUserInfo(user);
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
};
</script>

<style scoped>
.login {
  width: 40%;
  position: relative;
  top: 100px;
  margin: 0 auto 150px;
  border: 1px solid #000;

  height: 400px;
}
.lg {
  height: 100px;
  background-color: black;
  color: azure;
  text-align: center;
  font-size: 30px;
  line-height: 100px;
}
.lg+div{
  
    width: 60%;
    margin: 50px auto 0;
}
.lg>i{
    font-size: 40px;
}
</style>
