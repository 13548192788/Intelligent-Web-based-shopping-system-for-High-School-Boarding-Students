<template>
  <div class="manager-container">
    <!--  Head  -->
    <div class="manager-header">
      <div class="manager-header-left">
        <img src="@/assets/imgs/logo.png" />
        <div class="title">Shopping Management System</div>
      </div>

      <div class="manager-header-center">
<!--        导航组件，用于在页面中展示层级导航-->
<!--        It is the navigation component, which is used to display hierarchical navigation in the page-->
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">Home</el-breadcrumb-item>
<!--          current route-->
          <el-breadcrumb-item :to="{ path: $route.path }">{{ $route.meta.name }}</el-breadcrumb-item>
        </el-breadcrumb>
      </div>

      <div class="manager-header-right">
<!--        创建一个下拉菜单-->
<!--        Create a drop-down menu-->
        <el-dropdown placement="bottom">
          <div class="avatar">
            <img :src="user.avatar || 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'" />
            <div>{{ user.name ||  'Administrator' }}</div>
          </div>
          <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item @click.native="goToPerson">Personal Information</el-dropdown-item>
                        <el-dropdown-item @click.native="$router.push('/password')">Modify Password</el-dropdown-item>
            <el-dropdown-item @click.native="logout">Exit</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>

    <!--  Body  -->
    <div class="manager-main">
      <!--  Sidebar  -->
      <div class="manager-main-left">
        <el-menu :default-openeds="['info', 'user']" router style="border: none" :default-active="$route.path">
          <el-menu-item index="/home">
            <i class="el-icon-s-home"></i>
            <span slot="title">System Home</span>
          </el-menu-item>
          <el-submenu index="info">
            <template slot="title">
              <i class="el-icon-menu"></i><span>Information Manage</span>
            </template>
            <el-menu-item v-if="user.role === 'ADMIN'" index="/category">Category information</el-menu-item>
            <el-menu-item v-if="user.role !== 'USER'" S index="/product">Product Manage</el-menu-item>
          </el-submenu>

          <el-submenu index="user" v-if="user.role === 'ADMIN'">
            <template slot="title">
              <i class="el-icon-menu"></i><span>User Manage</span>
            </template>
            <el-menu-item index="/admin">Administrator Manage</el-menu-item>
            <el-menu-item index="/user">User Manage</el-menu-item>
            <el-menu-item index="/seller">Seller Manage</el-menu-item>
          </el-submenu>
        </el-menu>
      </div>

      <!--  Date Table  -->
      <div class="manager-main-right">
        <router-view @update:user="updateUser" />
      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: "Manager",
  data() {
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
    }
  },
  created() {
    if (!this.user.id) {
      this.$router.push('/login')
    }
  },
  methods: {
    updateUser() {
      this.user = JSON.parse(localStorage.getItem('xm-user') || '{}')   // Recapture the user's latest information
    },
    goToPerson() {
      if (this.user.role === 'ADMIN') {
        this.$router.push('/adminPerson')
      }
      if (this.user.role === 'SELLER') {
        this.$router.push('/sellerPerson')
      }
    },
    logout() {
      localStorage.removeItem('xm-user')
      this.$router.push('/login')
    }
  }
}
</script>

<style scoped>
@import "@/assets/css/manager.css";
</style>