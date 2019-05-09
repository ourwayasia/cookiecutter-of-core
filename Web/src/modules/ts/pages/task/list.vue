<template>
  <div class="ts-task-list">
    <div class="content-box">
      <div class="content-borderbox-top clearfix">
        <div class="content-tab">
          <a :class="{'active':PageType==='todo'}" @click="PageType='todo'">待办<span>25</span></a>
          <a :class="{'active':PageType==='toread'}" @click="PageType='toread'">待阅<span>8</span></a>
          <a :class="{'active':PageType==='done'}" @click="PageType='done'">已办<span>15</span></a>
          <a :class="{'active':PageType==='attention'}" @click="PageType='attention'">关注<span>2</span></a>
        </div>
        <div class="borderbox-title-ctrl">
          <div class="borderbox-title-ctrl-item hoverdown">
            <div class="borderbox-title-ctrl-name">
              <span>级别</span>
              <i class="fa fa-caret-down"></i>
            </div>
            <div class="hoverdown-menu">
              <ul class="hoverdown-menu-content">
                <li>级别一</li>
                <li>级别二</li>
                <li>级别三</li>
                <li>级别四</li>
              </ul>
            </div>
          </div>
          <div class="borderbox-title-ctrl-item hoverdown">
            <div class="borderbox-title-ctrl-name">
              <span>类型</span>
              <i class="fa fa-caret-down"></i>
            </div>
            <div class="hoverdown-menu">
              <ul class="hoverdown-menu-content">
                <li>类型一</li>
                <li>类型二</li>
                <li>类型三</li>
                <li>类型四</li>
              </ul>
            </div>
          </div>
          <div class="borderbox-title-ctrl-item hoverdown">
            <div class="borderbox-title-ctrl-name">
              <span>状态</span>
              <i class="fa fa-caret-down"></i>
            </div>
            <div class="hoverdown-menu">
              <ul class="hoverdown-menu-content">
                <li>状态一</li>
                <li>状态二</li>
                <li>状态三</li>
                <li>状态四</li>
              </ul>
            </div>
          </div>
          <div class="borderbox-title-ctrl-item">
            <div class="borderbox-title-ctrl-name">
              <span>日期</span>
              <i class="fa fa-long-arrow-down"></i>
            </div>
          </div>
          <div class="borderbox-title-ctrl-search">
            <input class="form-control" type="text" placeholder="请输入标题关键字" />
            <i class="fa fa-search"></i>
          </div>
          <div class="borderbox-title-ctrl-btn">
            <i class="icon icon-hamburger-l" :class="{'active':SimpleView}" @click="toggleView(true)"></i>
            <i class="icon icon-hamburger-s" :class="{'active':!SimpleView}" @click="toggleView(false)"></i>
          </div>
        </div>
      </div>
    </div>
    <router-view ref="child"></router-view>
  </div>
</template>

<script>


export default {
  name: 'ts-task-list',
  components: {

  },
  watch: {
    PageType (page) {
      this.$router.push('/ts/task/' + page)
    }
  },
  data () {
    return {
      PageType: 'todo',
      SimpleView: false
    }
  },
  mounted () {
    this.refreshTab()
    setTimeout(() => {
      let num = Math.floor(Math.random() * 10 + 1)
      this.$bus.$emit('setMenuItemTip', 0, num)
      num = Math.floor(Math.random() * 100 + 1)
      this.$bus.$emit('setMenuItemTip', 1, num)
      num = Math.floor(Math.random() * 1000 + 1)
      this.$bus.$emit('setMenuItemTip', 2, num)
    }, 1000)
  },
  updated () {
    this.refreshTab()
  },
  methods: {
    refreshTab () {
      let arr = this.$route.path.split('/')
      this.PageType = arr[3] === 'list' ? 'todo' : arr[3]
    },
    toggleView (val) {
      this.SimpleView = val
      if (this.$refs.child.toggleView)
        this.$refs.child.toggleView(val);
    }
  }
}
</script>

<style scoped>
</style>
