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
              <th width="5%">
                <div class="form-checkbox checkbox-only" @click="isSelectAll=!isSelectAll" :class="{checked:isSelectAll}"><i class="fa fa-check"></i></div>
              </th>
              <th width="25%">任务类型</th>
              <th width="25%">编辑时间</th>
              <th width="25%">任务标题</th>
              <th width="20%">操作</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(row,index) in rows" :key="index">
              <td>
                <div class="form-checkbox checkbox-only" :class="{checked:selectRowList.indexOf(row.Id)>-1}" @click="onSelectRow(row.Id)">
                  <i class="fa fa-check"></i>
                </div>
              </td>
              <td>{{row.TaskTypeName}}</td>
              <td>{{row.CreateDate|datetime('YYYY[/]MM[/]DD[ ]HH[:]mm')}}</td>
              <td>{{row.Title}}</td>
              <td>
                <div class="content-table-ctrl">
                  <a class="ctrl-comfirm" @click="onEdit(row.Id)">编辑</a>
                  <a class="ctrl-del" @click="onDelete(row.Id)">删除</a>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="content-table-footer clearfix">
        <div class="table-footer-ctrl">
          <!-- <button class="btn btn-primary">编辑</button> -->
          <button class="btn btn-default" @click="onBatchDelete" :disabled="selectRowList.length==0">删除</button>
        </div>
        <of-pagination :total="total" :pageSize="pageSize" :currentPage="pageIndex" @onSizeChange="handleSizeChange" @onCurrentChange="handleCurrentChange"></of-pagination>
      </div>
    </div>
  </of-scroll>
</template>
<script>
import OfScroll from '@/components/controls/of_scroll/of_scroll.vue'
import { queryTaskInfo, loadTaskTypeTree, deleteTaskInfo } from '@/modules/ts/api/taskstart.js'
import OfPagination from '@/components/controls/of_pagination/of_pagination'

export default {
  name: 'ts-task-draft',
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
      selectRowList: [],
      isSelectAll: false
    }
  },
  mounted () {
    this.queryTaskInfo()
    this.loadTypeTree()
  },
  watch: {
    isSelectAll (v) {
      this.selectRowList = []
      v && (this.selectRowList = this.rows.map(x => x.Id))
    }
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
      this.selectRowList = []
      this.isSelectAll = false
      queryTaskInfo(
        this.pageIndex
        , this.pageSize
        , this.sortOrder
        , this.sortField
        , this.fastSearchFields
        , this.fastSearchKeyWord
        , 1
        , this.currentTaskType ? this.currentTaskType.id : null
      ).then(x => {
        if (x.data.Code !== 0) {
          this.$messsage.error(x.data.Message)
          return
        }
        this.rows = x.data.Data.rows
        this.total = x.data.Data.total
      })
    },
    onSelectRow (id) {
      const i = this.selectRowList.indexOf(id);
      i > -1 ? this.selectRowList.splice(i, 1) : this.selectRowList.push(id)
    },
    onDelete (ids) {
      this.$confirm('确认删除所选择数据?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteTaskInfo(ids).then(x => {
          if (x.data.Code !== 0) {
            this.$message.error(x.data.Message)
            return
          }
          this.$message.success('删除成功');
          this.$emit('refreshTotalCount')
          this.queryTaskInfo();
        })
      }).catch(() => {
      });
    },
    onBatchDelete () {
      this.onDelete(this.selectRowList.join(','))
    },
    onEdit (id) {
      this.$router.push('/ts/task/edit?Id=' + id)
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

