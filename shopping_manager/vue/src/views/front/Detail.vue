<template>
  <div class="main-content">
    <div style="width: 70%; background-color: white; min-height: 1000px; margin: 10px auto; border-radius: 20px">
      <div style="padding: 15px 20px">
        <el-row :gutter="20">
          <el-col :span="12">
            <img :src="productData.img" alt="" style="width: 100%; height: 400px; border-radius: 20px">
          </el-col>
          <el-col :span="12">
            <div style="font-size: 24px; font-weight: 900; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;">{{productData.name}}</div>
<!--            <div style="color: #666666FF; margin-top: 5px; font-size: 15px">Count：{{productData.count}}</div>-->
            <div style="color: black; margin-top: 20px; font-size: 16px;">Price：<span style="font-size: 20px">{{productData.price}} RMB</span></div>
<!--            <div style="margin-top: 20px">-->
<!--              <img src="@/assets/imgs/right.png" alt="" style="width: 70%; height: 130px; border-radius: 15px">-->
<!--            </div>-->
            <div style="color: black; margin-top: 24px; font-size: 18px">Seller：<a href="#" @click="navTo('/front/seller?id=' + productData.sellerId)">{{productData.sellerName}}</a></div>
            <div style="color: black; margin-top: 24px; font-size: 18px">Category：<a href="#" @click="navTo('/front/category?id=' + productData.categoryId)">{{productData.categoryName}}</a></div>
            <div style="color: #666666FF; margin-top: 24px; display: flex; flex-direction: column; align-items: center;">
              <el-button style="background-color: #C299BA; border-color: #C299BA; color: white; width: 400px; height: 50px;" round @click="addCart"><span style="font-size: 20px">Add to cart</span></el-button>
              <el-button style="background-color: #C299BA; border-color: #C299BA; color: white; width: 400px; height: 50px; margin-top: 15px;" round @click="collect"><span style="font-size: 20px">Collect it</span></el-button>
            </div>
          </el-col>
        </el-row>
      </div>
      <div style="padding: 15px 20px">
        <el-tabs v-model="activeName" @tab-click="handleClick">
          <el-tab-pane label="Detail" name="first">
            <div style="padding: 10px 75px" v-html="productData.description"></div>
<!--            padding 属性用于设置元素的内边距，即元素内容与边框之间的距离 第一个值表示上下的内边距大小，第二个值表示左右的内边距大小-->
          </el-tab-pane>
          <el-tab-pane label="Comment" name="second">
            <div style="margin-top: 10px">
              <div style="margin-top: 20px" v-for="item in commentData">
                <div style="display: flex">
                  <div style="width: 40px">
                    <img :src="item.userAvatar" alt="" style="height: 40px; width: 40px; border-radius: 50%">
                  </div>
                  <div style="width: 200px; margin-left: 10px">
                    <div style="font-weight: 700; font-size: 17px; color: #000000FF">{{item.userName}}</div>
                    <div style="color: #7A7A7AFF">{{item.time}}</div>
                  </div>
                </div>
                <div style="margin-top: 15px; font-size: 16px">{{item.content}}</div>
              </div>
            </div>
          </el-tab-pane>
        </el-tabs>
      </div>
    </div>
  </div>
</template>

<script>

export default {

  data() {
    let productId = this.$route.query.id
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      productId: productId,
      productData: {},
      activeName: 'first',
      commentData: []
    }
  },
  mounted() {
    this.loadProduct()
    this.loadComments()
  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    loadProduct() {
      this.$request.get('/product/selectById?id=' + this.productId).then(res => {
        if (res.code === '200') {
          this.productData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    handleClick(tab, event) {
      this.activeName = tab.name
    },
    collect() {
      let data = {
        userId: this.user.id,
        sellerId: this.productData.sellerId,
        productId: this.productId
      }
      this.$request.post('/collect/add', data).then(res => {
        if (res.code === '200') {
          this.$message.success('Collect Successfully')
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    addCart() {
      let data = {num: 1, userId: this.user.id, productId: this.productId, sellerId: this.productData.sellerId}
      this.$request.post('/cart/add', data).then(res => {
        if (res.code === '200') {
          this.$message.success('Operation Successfully')
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadComments() {
      this.$request.get('/comment/selectByProductId?id=' + this.productId).then(res => {
        if (res.code === '200') {
          this.commentData = res.data
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
