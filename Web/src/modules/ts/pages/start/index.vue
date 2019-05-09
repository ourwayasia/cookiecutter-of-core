<template>
  <div class="ts-task-typetree">
    <div class="content-box">
      <div class="content-borderbox-top clearfix">
        <div class="content-tab">
          <a @click="chooseTab('list')" :class="{active:currentTab==='list'}">发起任务</a>
          <a @click="chooseTab('input')" :class="{active:currentTab==='input'}">已录入<span>{{taskInputCount||''}}</span></a>
          <a @click="chooseTab('draft')" :class="{active:currentTab==='draft'}">草稿箱<span>{{taskDraftCount||''}}</span></a>
          <a @click="chooseTab('import')" :class="{active:currentTab==='import'}">批量导入</a>
        </div>
      </div>
    </div>
    <router-view @refreshTotalCount="getTaskTotalCount"></router-view>
  </div>
</template>
<script>

import { getTaskTotalCount } from '@/modules/ts/api/taskstart.js'
export default {
  name: 'ts-task-typetree',
  data () {
    return {
      currentTab: 'list',
      taskDraftCount: 0,
      taskInputCount: 0
    }
  },
  updated () {
    this.refreshTab()
  },
  mounted () {
    //this.refreshTab()
    this.getTaskTotalCount()
  },
  methods: {
    refreshTab () {
      let arr = this.$route.path.split('/')
      this.currentTab = arr[3] === 'index' ? 'list' : arr[3]
    },
    getTaskTotalCount () {
      getTaskTotalCount().then(x => {
        if (x.data.Code !== 0) {
          this.$message.warning(x.data.Message)
          return
        }
        this.taskDraftCount = x.data.Data.TaskDraftCount
        this.taskInputCount = x.data.Data.TaskInputCount
      })
    },
    chooseTab (tab) {
      this.currentTab = tab;
      this.$router.push('/ts/start/' + tab)
    }
  }
}
</script>

<style scoped>
</style>
