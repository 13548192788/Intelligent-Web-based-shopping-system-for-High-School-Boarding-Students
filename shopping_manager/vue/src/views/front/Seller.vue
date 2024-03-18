<template>
  <div class="main-content">
    <div style="width: 80%; margin: 10px auto; border-radius: 20px">
      <div style="height: 100px; padding: 0 10px; display: flex; align-items: center; border-radius: 25px; background-color: white;">
        <img :src="sellerData.avatar" alt="" style="height: 60px; width: 60px; border-radius: 50%">
        <div style="width: 220px; margin: 0 30px 0 15px; font-size: 20px; font-weight: bold;">
          <div style="height: 30px; line-height: 30px">{{sellerData.name}}</div>
<!--          <img src="@/assets/imgs/icon.png" alt="" style="height: 25px; margin-top: 5px">-->
        </div>
        <div style="width: 150px; height: 100px; padding: 20px">
          <div style="font-size: 16px; height: 30px; line-height: 30px; color: #000000FF">Phone</div>
          <div style="font-size: 16px; height: 30px; line-height: 30px; ">{{sellerData.phone}}</div>
        </div>
        <div style="width: 200px; height: 100px; padding: 20px">
          <div style="font-size: 16px; height: 30px; line-height: 30px; color: #000000FF">Email</div>
          <div style="font-size: 16px; height: 30px; line-height: 30px; ">{{sellerData.email}}</div>
        </div>
        <div style="flex: 1; height: 100px; padding: 20px">
          <div style="height: 60px; line-height: 30px; font-size: 16px; color: #000000FF; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
            Description：{{sellerData.description}}
          </div>
        </div>
      </div>
      <div style="border-radius: 20px; padding: 0 20px; background-color: white; margin-top: 20px">
        <div style="font-size: 18px; color: #000000FF; line-height: 80px; border-bottom: #cccccc 1px solid">Total {{productData.length}} products</div>
        <div style="margin-top: 20px">
          <el-row>
            <el-col :span="5" style="margin-bottom: 20px" v-for="item in productData">
              <img :src="item.img" alt="" style="width: 100%; height: 150px; border-radius: 10px; border: #cccccc 1px solid" @click="navTo('/front/detail?id=' + item.id)">
              <div style="margin-top: 10px; font-weight: 500; font-size: 16px; width: 160px; color: #000000FF; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" @click="navTo('/front/detail?id=' + item.id)">{{item.name}}</div>
              <div style="margin-top: 5px; font-size: 20px; color: #FF5000FF">￥ {{ item.price }}</div>
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
    let sellerId = this.$route.query.id
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      sellerId: sellerId,
      productData: [],
      sellerData: {}
    }
  },
  mounted() {
    this.loadSeller()
    this.loadProduct()
  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    loadSeller() {
      this.$request.get('/seller/selectById/' + this.sellerId).then(res => {
        if (res.code === '200') {
          this.sellerData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadProduct() {
      this.$request.get('/product/selectBySellerId?id=' + this.sellerId).then(res => {
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

<style scoped>
.el-col-5{
  width: 20%;
  max-width: 20%;
  padding: 10px 10px;
}
</style>
