<template>
   <div >
    <el-container style="height: 500px; border: 1px solid #eee">
        <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
            <el-menu :default-openeds="['1', '3']">
                <el-submenu index="1">
                    <template slot="title"><i class="el-icon-message"></i>我的账户</template>
                    <el-menu-item-group>
                        <el-menu-item index="1-1">账户信息</el-menu-item>
                        <el-menu-item index="1-2">流水账单</el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
                <el-submenu index="2">
                    <template slot="title"><i class="el-icon-menu"></i>安全中心</template>
                    <el-menu-item index="2-3">修改密码</el-menu-item>
                </el-submenu>
            </el-menu>
        </el-aside>

        <el-container>
            <el-header style="text-align: right; font-size: 12px;background-color:whitesmoke;position: relative;top:-1px">
                <el-dropdown>
                    <i class="el-icon-setting" style="margin-right: 15px;font-size: 18px;"></i>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item><span @click="signOut">退出</span></el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>
                <span style="font-size: 18px;">您好，{{userName}}</span>
            </el-header>

            <el-main>
                <router-view></router-view>
            </el-main>
        </el-container>
    </el-container>
   </div>
</template>

<script>
    export default {
        data() {
            return {
                userName: null
            }
        },
        mounted() {
            this.userName = this.getUserInfo().username;
         },
        methods: {
            signOut() {
                this.setUserInfo('{}');
                this.$router.push({ name: 'login' });
            },
            setUserInfo(user) {
                this.$userGloby.setUserInfo(user);
            }, getUserInfo() {
               return  this.$userGloby.getUserInfo();
            }
        }

    }
</script>

<style scoped>
    .el-header {
        background-color: #b3c0d1;
        color: #333;
        line-height: 60px;
    }

    .el-aside {
        color: #333;
    }
    .content{

    }
</style>