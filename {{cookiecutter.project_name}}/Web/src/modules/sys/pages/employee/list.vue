<template>
  <of-page mode="list-form" :leftWidth="300" @tableResize="tableResize">
    <div slot="leftArea">
      <department-tree @onSelectNode="selectNode" :url="departmentUrl"></department-tree>
    </div>
    <div slot="toolBar">
      <el-button v-access:add icon="el-icon-plus" @click="add" size="small" :disabled="isloading">新增</el-button>
      <el-button v-access:delete icon="el-icon-delete" size="small" :disabled="isDelete" @click="batchDel">删除</el-button>
    </div>
    <div slot="searchBar">
      <of-search @search="search"></of-search>
    </div>
    <div slot="content">
      <el-table border highlight-current-row style="width: 100%" header-cell-class-name="header-row" :data="listData" :max-height="tableMaxHeight" v-loading="isloading" @selection-change='onSelectionChange'>
        <el-table-column type="selection" width="55" align="center"> </el-table-column>
        <el-table-column prop="EmployeeNo" label="工号" width="80" sortable></el-table-column>
        <el-table-column prop="RealName" label="姓名" width="100" sortable></el-table-column>
        <el-table-column prop="Sex" label="性别" width="80" align="center" :formatter="formatterSex" sortable></el-table-column>
        <el-table-column prop="DepartmentName" label="部门" sortable></el-table-column>
        <el-table-column prop="Status" width="80" label="状态" align="center" sortable :formatter="formatterStatus"></el-table-column>
        <el-table-column prop="SourceType" width="80" label="来源" align="center" sortable :formatter="formatterSourceType"></el-table-column>
        <el-table-column label="操作" width="200" align="center" header-align="center">
          <template slot-scope="scope">
            <el-button v-access:modify @click="innerDisableOrEnabled(scope.row)" type="text" size="mini">{{scope.row.Status === 0 ? '启用':'禁用'}}</el-button>
            <el-button v-access:modify @click="innerEdit(scope.row)" type="text" :disabled="scope.row.SourceType != 0 ? true : false" size="mini">编辑</el-button>
            <el-button v-access:delete @click="innerDel(scope.row)" type="text" :disabled="scope.row.SourceType != 0 ? true : false" size="mini">删除</el-button>
            <el-button v-access:modify @click="innerEditPdw(scope.row)" type="text" :disabled="isEditPdw(scope.row.IsStaff)" size="mini">修改密码</el-button>
          </template>
        </el-table-column>
      </el-table>
      <of-pagination :total="total" :pageSize="pageSize" :currentPage="currentPage" @onSizeChange="handleSizeChange" @onCurrentChange="handleCurrentChange">
      </of-pagination>
      <employee-edit v-if="editVisible" :dataForm="formData" @formCallBack="formCallBack" :formVisible="editVisible" :formTitle="formTitle"></employee-edit>
      <password-edit v-if="editPdwVisible" :dataForm="formData" :formTitle="formTitle" @formCallBack="editPdwVisible=false"></password-edit>
    </div>
  </of-page>
</template>

<script>
import EmployeeEdit from '@/modules/sys/pages/employee/edit'
import DepartmentTree from '@/components/controls/of_tree/of_tree'
import OfPagination from '@/components/controls/of_pagination/of_pagination'
import OfPage from '@/components/base/of_page/of_page'
import OfSearch from '@/components/controls/of_search/of_search'
import PasswordEdit from '@/modules/sys/pages/employee/password_edit'
import moment from 'moment'

import { queryEmployee, deleteEmployee, disableOrEnabled } from '@/modules/sys/api/employee.js'

export default {
  name: 'sys-employee-list',
  data () {
    return {
      isloading: false,
      isDelete: true,
      listData: [],
      total: 0,
      currentPage: 1,
      pageSize: 15,
      sortOrder: 'asc',
      searchFields: 'EmployeeNo,RealName',
      serarchFilter: {
        keywords: ''
      },
      editVisible: false,
      editPdwVisible: false,
      formTitle: '',
      formData: {},
      tableMaxHeight: 500,
      departmentUrl: '/Sys/Department/LoadJsTreeNodes'
    }
  },
  components: {
    EmployeeEdit,
    DepartmentTree,
    OfPagination,
    OfPage,
    OfSearch,
    PasswordEdit
  },
  mounted () {
    this.loadData()
  },
  methods: {
    loadData (departmentId) {
      this.isloading = true
      queryEmployee(this.currentPage, this.pageSize, this.sortOrder, this.searchFields, this.serarchFilter.keywords, departmentId || '')
        .then((rep) => {
          if (rep.data.Code === 0) {
            this.total = rep.data.Data.total
            this.listData = rep.data.Data.rows
          }
          this.isloading = false
        })
    },
    add () {
      this.formTitle = '新增员工'
      this.formData = {
        Status: 1,
        Sex: 1,
        IsStaff: 1
      }
      this.editVisible = true
    },
    edit () {
      this.formTitle = '修改员工'
      this.editVisible = true
    },
    innerEdit (rowData) {
      this.formData = Object.assign({}, rowData)
      if (rowData.Birthday) {
        this.formData.Birthday = moment(rowData.Birthday).format('YYYY-MM-DD')
      }

      this.edit()
    },
    innerEditPdw (rowData) {
      this.formData = Object.assign({}, rowData)
      if (rowData.Birthday) {
        this.formData.Birthday = moment(rowData.Birthday).format('YYYY-MM-DD')
      }

      this.editPdw()
    },
    editPdw () {
      this.formTitle = '修改员工密码'
      this.editPdwVisible = true
    },
    innerDel (rowData) {
      this.$confirm('请确认是否删除选中的数据？', '系统提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.isloading = true
        deleteEmployee(rowData.Id).then((rep) => {
          this.isloading = false
          if (rep.data.Code === 0) {
            this.$message({
              message: '删除成功',
              type: 'success'
            })
            this.currentPage = 1
            this.loadData()
          } else {
            this.$message({
              message: rep.data.Message,
              type: 'error'
            })
          }
        }).catch((e) => {
          this.$message({
            message: e.toString(),
            type: 'error'
          })
        })
      })
    },
    innerDisableOrEnabled (rowData) {
      var message = ''
      if (rowData.Status === 0) { message = '请确认是否启用此用户？' } else { message = '请确认是否禁用此用户？' }
      this.$confirm(message, '系统提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.isloading = true
        disableOrEnabled(rowData.Id, !rowData.Status).then((rep) => {
          this.isloading = false
          if (rep.data.Code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success'
            })
            this.currentPage = 1
            this.loadData()
          } else {
            this.$message({
              message: rep.data.Message,
              type: 'error'
            })
          }
        }).catch((e) => {
          this.$message({
            message: e.toString(),
            type: 'error'
          })
        })
      })
    },
    batchDel () {
      this.innerDel({ Id: this.batchId })
    },
    selectNode (data) {
      this.currentPage = 1
      this.loadData(data.id === 'all' ? '' : data.id)
    },
    onSelectionChange (rowItems) {
      this.isDelete = !rowItems.length > 0
      if (rowItems.length) {
        const ids = []
        for (var i = 0; i < rowItems.length; i++) {
          ids.push(rowItems[i].Id)
        }
        this.batchId = ids.join(',')
      }
    },
    handleSizeChange (val) {
      this.currentPage = 1
      this.pageSize = val
      this.loadData()
    },
    handleCurrentChange (val) {
      if (this.total > this.pageSize) {
        this.currentPage = val
        this.loadData()
      }
    },
    formatterStatus (item) {
      return item.Status === 1 ? '已启用' : '已禁用'
    },
    formatterSourceType (item) {
      return item.SourceType === 1 ? '同步' : '录入'
    },
    formatterSex (item) {
      return item.Sex === 1 ? '男' : item.Sex === 2 ? '女' : ''
    },
    search (keyword) {
      this.currentPage = 1
      this.serarchFilter.keywords = keyword
      this.loadData()
    },
    setBoxCardHeight () {
      this.boxCardHeight = window.innerHeight - 160
      if (this.$refs.leftBoxCard && this.$refs.mainBoxCard) {
        if (this.$refs.leftBoxCard.$el && this.$refs.mainBoxCard.$el) {
          this.$refs.leftBoxCard.$el.style.height = `${this.boxCardHeight}px`
          this.$refs.mainBoxCard.$el.style.height = `${this.boxCardHeight}px`
        }
      }
      this.tableMaxHeight = this.boxCardHeight - 150
    },
    formCallBack (data) {
      this.editVisible = false
      if (data) {
        this.currentPage = 1
        this.loadData()
      }
    },
    tableResize (val) {
      this.tableMaxHeight = val
    },
    isEditPdw (IsStaff) {
      let ret = false
      let currentConfig = this.$store.getters.GetCurrentConfig
      if (currentConfig && currentConfig.PasswordVaildMode) {
        ret = currentConfig.PasswordVaildMode
      }
      if (ret && IsStaff === 0) { // 开启域验证并且是外部员工
        return false
      } else if (!ret) { // 没启用域验证
        return false
      } else {
        return true
      }
    }
  }
}
</script>

<style scoped>
.btn-oper {
  margin-top: -5px;
  float: right;
}
.box-card {
  overflow: auto;
}
.serach-warpper {
  width: 250px;
  float: left;
  margin-right: 10px;
}
</style>
