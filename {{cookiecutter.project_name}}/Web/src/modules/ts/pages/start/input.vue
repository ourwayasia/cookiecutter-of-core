<template>
  <of-scroll :top="146">
    <div class="content-box content-table-page">
      <div class="clearfix">
        <div class="borderbox-title-ctrl box-title-left">
          <div class="borderbox-title-ctrl-item hoverdown">
            <div class="borderbox-title-ctrl-name">
              <span>{{currentTaskType?currentTaskType.text:'任务类型'}}</span>
              <i class="fa fa-caret-down"></i>
            </div>
            <div class="hoverdown-menu">
              <ul class="hoverdown-menu-content">
                <li @click="selectTakeType(null,$event)">-- 所有类型 --</li>
                <template v-for="item in taskTypeTree">
                  <li @click="selectTakeType(item,$event)" :key="item.id">{{item.text}}</li>
                  <li @click="selectTakeType(child,$event)" :key="child.id" v-for="child in item.children">{{child.text}}</li>
                </template>
              </ul>
            </div>
          </div>
          <div class="borderbox-title-ctrl-item">
            <div class="borderbox-title-ctrl-name">
              <span @click="changeSortOrder">日期</span>
              <i class="fa" :class="[sortOrder==='desc'?'fa-long-arrow-down':'fa-long-arrow-up']"></i>
            </div>
          </div>
        </div>
        <div class="borderbox-title-ctrl">
          <div class="borderbox-title-ctrl-search">
            <input class="form-control" @keyup.enter="onSearch" v-model="fastSearchKeyWord" type="text" placeholder="请输入标题关键字">
            <i class="fa fa-search" @click="onSearch"></i>
          </div>
        </div>
      </div>
      <div class="content-table">
        <table cellpadding="0" cellspacing="0">
          <thead>
            <tr>
              <th width="5%">序号</th>
              <th width="13%">任务标题</th>
              <th width="20%">主办单位</th>
              <th width="13%">主办人</th>
              <th width="13%">录入人</th>
              <th width="13%">任务开始时间</th>
              <th width="13%">任务关闭时间</th>
              <th width="10%">状态</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(row,index) in rows" :key="index">
              <td>{{index+1}}</td>
              <td>{{row.Title}}</td>
              <td>{{row.HostDepartmentName}}</td>
              <td>{{row.HostName}}</td>
              <td>{{row.CreatorName}}</td>
              <td>{{row.BeginDate|datetime('YYYY[/]MM[/]DD')}}</td>
              <td>{{row.CloseDate|datetime('YYYY[/]MM[/]DD')}}</td>
              <td>{{row.Status|statusTextFilter}}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="content-table-footer clearfix">
        <of-pagination :total="total" :pageSize="pageSize" :currentPage="pageIndex" @onSizeChange="handleSizeChange" @onCurrentChange="handleCurrentChange"></of-pagination>
      </div>
    </div>
  </of-scroll>
</template>
<script>
import OfScroll from '@/components/controls/of_scroll/of_scroll.vue'
import { queryTaskInfo, loadTaskTypeTree } from '@/modules/ts/api/taskstart.js'
import OfPagination from '@/components/controls/of_pagination/of_pagination'

export default {
  name: 'ts-task-input',
  components: { OfScroll, OfPagination },
  data () {
    return {
      pageIndex: 1,
      pageSize: 15,
      sortOrder: 'desc',
      sortField: 'CreateDate',
      fastSearchFields: 'Title',
      fastSearchKeyWord: '',
      rows: [],
      total: 0,
      taskTypeTree: [],
      currentTaskType: null,
    }
  },
  mounted () {
    this.queryTaskInfo()
    this.loadTypeTree()
  },
  methods: {
    onSearch () {
      this.pageIndex = 1
      this.queryTaskInfo()
    },
    handleSizeChange (p) {
      this.pageSize = p
      this.pageIndex = 1
      this.queryTaskInfo()
    },
    handleCurrentChange (index) {
      this.pageIndex = index
      this.queryTaskInfo()
    },
    changeSortOrder () {
      this.sortOrder = this.sortOrder === 'desc' ? 'asc' : 'desc'
      this.onSearch()
    },
    selectTakeType (taskType) {
      this.currentTaskType = taskType
      this.onSearch()
    },
    loadTypeTree () {
      loadTaskTypeTree().then(x => {
        if (x.data.Code !== 0) {
          this.$message.error(x.data.Message)
          return
        }
        this.taskTypeTree = x.data.Data
      })
    },
    queryTaskInfo () {
      queryTaskInfo(
        this.pageIndex
        , this.pageSize
        , this.sortOrder
        , this.sortField
        , this.fastSearchFields
        , this.fastSearchKeyWord
        , 0
        , this.currentTaskType ? this.currentTaskType.id : null
      ).then(x => {
        if (x.data.Code !== 0) {
          this.$messsage.error(x.data.Message)
          return
        }
        this.rows = x.data.Data.rows
        this.total = x.data.Data.total
      })
    }
  },
  filters: {
    statusTextFilter (val) {
      switch (val) {
        case 0: return '草稿'
        case 1: return '下达审批中'
        case 2: return '正在执行'
        case 4: return '延期申请'
        case 5: return '关闭申请'
        case 6: return '取消申请'
        case 8: return '已关闭'
        case 10: return '已取消'
        default: return '未知'
      }
    }
  }
}
</script>
<style scoped>
.content-table-footer >>> .el-input {
  display: inline-block;
}
</style>

