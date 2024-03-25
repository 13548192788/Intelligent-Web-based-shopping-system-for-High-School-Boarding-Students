<template>
  <div class="main-content">
    <div style="display: flex; width: 85%; background-color: white; margin: 2px auto; border-radius: 20px">
      <div style="flex: 1; padding: 0 20px">
        <div style="font-size: 24px; color: #000000FF; line-height: 80px; border-bottom: #cccccc 1px solid">{{categoryData.name}}</div>
        <div style="margin: 2px 0">
          <el-row :gutter="5">
            <el-col :span="6" style="margin-bottom: 20px" v-for="(item, index) in productData" >
              <div v-if="index % 5 === 0" style="clear: both;"></div>
              <div style="width: 200px; height: 250px; display: flex; flex-direction: column; align-items: center; border-radius: 10px; border: #cccccc 1px solid; overflow: hidden;">
              <img @click="navTo('/front/detail?id=' + item.id)" :src="item.img" alt="" style="width: 100%; height: 175px; border-radius: 10px; border: #cccccc 1px solid">
              <div @click="navTo('/front/detail?id=' + item.id)" style="margin-top: 10px; font-weight: 500; font-size: 16px; width: 180px; color: #000000FF; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">{{item.name}}</div>
              <div style="margin-top: 5px; font-size: 20px; color: #FF5000FF">￥ {{item.price}}</div>
              </div>
            </el-col>
          </el-row>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {

  data() {
    let categoryId = this.$route.query.id
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      categoryId: categoryId,
      productData: [],
      categoryData: {}
    }
  },
  mounted() {
    this.loadProduct()
    this.loadCategory()
  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    loadCategory() {
      this.$request.get('/category/selectById/' + this.categoryId).then(res => {
        if (res.code === '200') {
          this.categoryData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadProduct() {
      this.$request.get('/product/selectByCategoryId?id=' + this.categoryId).then(res => {
        if (res.code === '200') {
          this.productData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    navTo(url) {
      location.href = url
    }
  }
}
</script>
