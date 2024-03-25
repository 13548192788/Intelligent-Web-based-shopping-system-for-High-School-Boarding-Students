import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

// 解决导航栏或者底部导航tabBar中的vue-router在3.0版本以上频繁点击菜单报错的问题。
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push (location) {
  return originalPush.call(this, location).catch(err => err)
}

const routes = [
  {
    path: '/',
    name: 'Manager',
    component: () => import('../views/Manager.vue'),
    redirect: '/home',  // 重定向到主页
    children: [
      { path: '403', name: 'NoAuth', meta: { name: 'No Access' }, component: () => import('../views/manager/403') },
      { path: 'home', name: 'Home', meta: { name: 'System Home' }, component: () => import('../views/manager/Home') },
      { path: 'admin', name: 'Admin', meta: { name: 'Administrator Information' }, component: () => import('../views/manager/Admin') },
      { path: 'adminPerson', name: 'AdminPerson', meta: { name: 'Admin Personal Information' }, component: () => import('../views/manager/AdminPerson') },
      { path: 'password', name: 'Password', meta: { name: 'Modify Password' }, component: () => import('../views/manager/Password') },
      { path: 'notice', name: 'Notice', meta: { name: 'Notice Information' }, component: () => import('../views/manager/Notice') },
      { path: 'category', name: 'Category', meta: { name: 'Category Manage' }, component: () => import('../views/manager/Category') },
      { path: 'seller', name: 'Seller', meta: { name: 'Seller Information' }, component: () => import('../views/manager/Seller') },
      { path: 'sellerPerson', name: 'SellerPerson', meta: { name: 'Seller Personal Information' }, component: () => import('../views/manager/SellerPerson') },
      { path: 'user', name: 'User', meta: { name: 'User Information' }, component: () => import('../views/manager/User') },
      { path: 'product', name: 'Product', meta: { name: 'Product Manage' }, component: () => import('../views/manager/Product') },
      { path: 'orders', name: 'Orders', meta: { name: 'Order Manage' }, component: () => import('../views/manager/Orders') },
      { path: 'comment', name: 'Comment', meta: { name: 'Comment Manage' }, component: () => import('../views/manager/Comment') },
    ]
  },
  {
    path: '/front',
    name: 'Front',
    component: () => import('../views/Front.vue'),
    children: [
      { path: 'home', name: 'Home', meta: { name: 'System Home' }, component: () => import('../views/front/Home') },
      { path: 'person', name: 'Person', meta: { name: 'Personal Information' }, component: () => import('../views/front/Person') },
      { path: 'collect', name: 'Collect', meta: { name: 'My Collection' }, component: () => import('../views/front/Collect') },
      { path: 'address', name: 'Address', meta: { name: 'My Address' }, component: () => import('../views/front/Address') },
      { path: 'cart', name: 'Cart', meta: { name: 'My Cart' }, component: () => import('../views/front/Cart') },
      { path: 'orders', name: 'Orders', meta: { name: 'My Orders' }, component: () => import('../views/front/Orders') },
      { path: 'detail', name: 'Detail', meta: { name: 'Product Information' }, component: () => import('../views/front/Detail') },
      { path: 'search', name: 'Search', meta: { name: 'Search' }, component: () => import('../views/front/Search') },
      { path: 'category', name: 'Category', meta: { name: 'Category' }, component: () => import('../views/front/Category') },
      { path: 'seller', name: 'Seller', meta: { name: 'Seller' }, component: () => import('../views/front/Seller') },
    ]
  },
  { path: '/login', name: 'Login', meta: { name: 'Login' }, component: () => import('../views/Login.vue') },
  { path: '/register', name: 'Register', meta: { name: 'Register' }, component: () => import('../views/Register.vue') },
  { path: '*', name: 'NotFound', meta: { name: 'Not Founds' }, component: () => import('../views/404.vue') },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// 注：不需要前台，可以注释掉该路由守卫
// 路由守卫
// router.beforeEach((to ,from, next) => {
//   let user = JSON.parse(localStorage.getItem("xm-user") || '{}');
//   if (to.path === '/') {
//     if (user.role) {
//       if (user.role === 'USER') {
//         next('/front/home')
//       } else {
//         next('/home')
//       }
//     } else {
//       next('/login')
//     }
//   } else {
//     next()
//   }
// })

export default router
