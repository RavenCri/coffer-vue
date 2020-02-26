<template>
    <div class="content" style="width: 100%;">
       
       
        <el-collapse accordion>
            <el-collapse-item>
              <template slot="title">
                会员状态<i class="header-icon el-icon-info"></i>
              </template>
              <span><i class="el-icon-position"></i>余额：500元</span></br>
              <span><i class="el-icon-star-off"></i>积分：5018</span></br>
              <span><i class="el-icon-medal-1"></i>会员等级：V7</span></br>
              <span>v7<el-progress :percentage="50"></el-progress>V8</span></br>
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
</template>

<script>
export default {
    name: 'name'

}
</script>

<style scoped>
.content{
    width: 40%;
    text-align: center;
}
</style>