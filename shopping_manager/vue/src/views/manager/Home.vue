<template>
  <div>
    <div class="card" style="padding: 15px">
      Welcome，{{ user?.name }}!
    </div>

    <div style="display: flex; margin: 10px 0">
      <div style="width: 50%;" class="card">
        <!--        Notice -->
        <!--        <div style="margin-bottom: 30px; font-size: 20px; font-weight: bold">Notice List</div>-->
        <!--        <div >-->
        <!--          <el-timeline  reverse slot="reference">-->
        <!--            <el-timeline-item v-for="item in notices" :key="item.id" :timestamp="item.time">-->
        <!--              <el-popover-->
        <!--                  placement="right"-->
        <!--                  width="200"-->
        <!--                  trigger="hover"-->
        <!--                  :content="item.content">-->
        <!--                <span slot="reference">{{ item.title }}</span>-->
        <!--              </el-popover>-->
        <!--            </el-timeline-item>-->
        <!--          </el-timeline>-->
        <!--        </div>-->
      </div>
    </div>
  </div>
</template>

<script>

//Display the welcome message that users see on the home page
export default {
  name: 'Home',
  data() {
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      notices: []
    }
    //Get user data from localStorage and store it in the `user` attribute.
    // If there is no user data in local storage, an empty object is used
  },
  created() {
    this.$request.get('/notice/selectAll').then(res => {
      this.notices = res.data || []
    })
  }
}
</script>
