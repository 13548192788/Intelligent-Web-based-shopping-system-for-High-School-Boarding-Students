<template>
  <div>
    <!--Head-->
    <div class="front-header">
      <div class="front-header-left" @click="navTo('/front/home')">
        <img src="@/assets/imgs/logo.png" alt="">
        <div class="title">GoShopping</div>
      </div>
      <div class="front-header-center">
        <el-input style="width: 200px" placeholder="Please enter  " v-model="name"></el-input>
        <el-button type="primary" style="margin-left: 5px" @click="search">Search</el-button>
      </div>
      <div class="front-header-right">
        <div v-if="!user.username">
          <el-button @click="$router.push('/login')">Login</el-button>
          <el-button @click="$router.push('/register')">Register</el-button>
        </div>
        <div v-else>
          <el-dropdown>
            <div class="front-header-dropdown">
              <img @click="navTo('/front/person')" :src="user.avatar" alt="">
              <div style="margin-left: 10px">
                <span>{{ user.name }}</span><i class="el-icon-arrow-down" style="margin-left: 5px"></i>
              </div>
            </div>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>
                <div style="text-decoration: none" v-if="user.role !== 'USER'" @click="navTo('/home')">Management</div>
              </el-dropdown-item>
              <el-dropdown-item>
                <div style="text-decoration: none" @click="navTo('/front/cart')">My Cart</div>
              </el-dropdown-item>
              <el-dropdown-item>
                <div style="text-decoration: none" @click="navTo('/front/collect')">My Collection</div>
              </el-dropdown-item>
              <el-dropdown-item>
                <div style="text-decoration: none" @click="navTo('/front/address')">My Address</div>
              </el-dropdown-item>
              <el-dropdown-item>
                <div style="text-decoration: none" @click="navTo('/front/orders')">My Orders</div>
              </el-dropdown-item>
              <el-dropdown-item>
                <div style="text-decoration: none" @click="logout">Exit</div>
              </el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </div>
    </div>
<!--    <div class="navbar">-->
<!--      <button class="nav-item" @click="navTo('/front/home')">首页</button>-->
<!--      <div class="nav-item with-dropdown">-->
<!--        <button class="dropdown-toggle" @click="toggleDropdown" v-for="item in categoryData">商品分类</button>-->
<!--        <ul class="dropdown-menu" v-show="showDropdown">-->
<!--          <div style="margin-left: 10px; font-size: 17px"><a href="#" @click="navTo('/front/category?id=' + item.id)">{{item.name}}</a></div>-->
<!--        </ul>-->
<!--      </div>-->
<!--      <button class="nav-item" @click="navTo('/products')">产品</button>-->
<!--      <button class="nav-item" @click="navTo('/news')">新闻</button>-->
<!--      <button class="nav-item" @click="navTo('/brands')">品牌</button>-->
<!--    </div>-->
<!--    主体-->
    <div class="main-body">
      <router-view ref="child" @update:user="updateUser" />
    </div>
  </div>

</template>

<script>

export default {
  name: "FrontLayout",

  data () {
    return {
      showDropdown: false,
      top: '',
      notice: [],
      categoryData: [],
      name: '',//使得搜索栏可输入
      user: JSON.parse(localStorage.getItem("xm-user") || '{}'),
    }
  },

  mounted() {
    this.loadNotice()
    this.loadCategory()
  },
  methods: {
    loadCategory() {
      this.$request.get('/category/selectAll').then(res => {
        if (res.code === '200') {
          this.categoryData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadNotice() {
      this.$request.get('/notice/selectAll').then(res => {
        this.notice = res.data
        let i = 0
        if (this.notice && this.notice.length) {
          this.top = this.notice[0].content
          setInterval(() => {
            this.top = this.notice[i].content
            i++
            if (i === this.notice.length) {
              i = 0
            }
          }, 2500)
        }
      })
    },
    updateUser() {
      this.user = JSON.parse(localStorage.getItem('xm-user') || '{}')   // 重新获取下用户的最新信息
    },
    toggleDropdown() {
      this.showDropdown = !this.showDropdown;
    },
    // 退出登录
    logout() {
      localStorage.removeItem("xm-user");
      this.$router.push("/login");
    },
    search() {
      let name = this.name ? this.name : ''
      location.href = '/front/search?name=' + name
    },
    navTo(url) {
      location.href = url
    },
  }

}
</script>

<style scoped>
@import "@/assets/css/front.css";
</style>