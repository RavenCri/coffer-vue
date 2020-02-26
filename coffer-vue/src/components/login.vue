<template>
  <div class="login">
    <div class="lg"><i class="el-icon-user"></i><span> 登 录</span></div>
    <div>
      <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="账号" prop="username">
          <el-input type="el-input" v-model="ruleForm.username" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input type="password" v-model="ruleForm.password" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')">登陆</el-button>
          <el-button @click="resetForm('ruleForm')">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
  export default {
    mounted() {

    },
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

            this.$axios.get("/user/login", {       // 还可以直接把参数拼接在url后边
              params: {
                uname: formName['username'],
                pwd: formName.password
              }
            }).then(res => {
            
              console.log(res)
              if (res.data.state == 2000) {
                    //this.$router.go(-1);
                    // window.history.back() 
                // 如果没有 要跳转的地址直接跳入
                if (JSON.stringify(this.$route.params) != '{}') {
                  console.log("有目标地址传进来" + this.$route.params.redirect)
                  // 这里写path比较灵活 写name的话 如果目标地址携带了参数还得 再用 params或者query传过去
                  // 而path直接接受 要重定向的地址即可。
                  this.$router.push({ path: decodeURIComponent(this.$route.params.redirect) });
                } else {
                  console.log("没有目标地址传进来")
                  this.$router.push({ name: 'personCenter' });
                }
              } else {
                this.$message({
                  message: res.data.message,
                  type: "error"
                });
              }

            }).catch(function (error) {
              console.log(error);
            });

          } else {
            this.$message({
              message: "信息填写不完整",
              type: "error"
            });

          }
        });
      },
      setUserInfo(user) {
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

  .lg+div {

    width: 60%;
    margin: 50px auto 0;
  }

  .lg>i {
    font-size: 40px;
  }
</style>