<template>
  <of-page mode="list-form" :leftWidth="300" @tableResize="tableResize">
    <div slot="leftArea">
      <module-tree @onSelectNode="selectNode" :url="moduleUrl" :showFirstAll="true"></module-tree>
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
        <el-table-column prop="ModuleKey" label="模块编码" sortable></el-table-column>
        <el-table-column prop="Name" label="权限名称" sortable></el-table-column>
        <el-table-column prop="Operations" label="操作集合" sortable></el-table-column>
        <el-table-column prop="Actions" label="动作集合" sortable></el-table-column>
        <el-table-column label="操作" width="150" align="center">
          <template slot-scope="scope">
            <el-button v-access:modify @click="innerEdit(scope.row)" type="text" size="mini">编辑</el-button>
            <el-button v-access:delete @click="innerDel(scope.row)" type="text" size="mini">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <of-pagination :total="total" :pageSize="pageSize" :currentPage="currentPage" @onSizeChange="handleSizeChange" @onCurrentChange="handleCurrentChange">
      </of-pagination>
      <permission-edit v-if="editVisible" :dataForm="formData" @formCallBack="formCallBack" :formVisible="editVisible" :formTitle="formTitle"></permission-edit>
    </div>
  </of-page>
</template>

<script>
import PermissionEdit from '@/modules/sys/pages/permission/edit'
import ModuleTree from '@/components/controls/of_tree/of_tree'
import OfPagination from '@/components/controls/of_pagination/of_pagination'
import OfPage from '@/components/base/of_page/of_page'
import OfSearch from '@/components/controls/of_search/of_search'

import { queryPermission, deletePermission } from '@/modules/sys/api/permission.js'


export default {
  name: 'sys-permission-list',
  data () {
    return {
      isloading: false,
      isDelete: true,
      listData: [],
      total: 0,
      currentPage: 1,
      pageSize: 15,
      sortField: 'id',
      sortOrder: 'asc',
      searchFields: 'Name,ModuleKey',
      serarchFilter: {
        keywords: ''
      },
      editVisible: false,
      formTitle: '',
      formData: {},
      tableMaxHeight: 500,
      moduleUrl: '/Sys/Module/LoadJsTreeNodes'
    }
  },
  components: {
    PermissionEdit,
    ModuleTree,
    OfPagination,
    OfPage,
    OfSearch
  },
  mounted () {
    this.loadData()
  },
  methods: {
    loadData (moduleId) {
      this.formData = {
        ModuleID: moduleId || ''
      }
      this.isloading = true
      queryPermission(
        this.currentPage,
        this.pageSize,
        this.sortOrder,
        this.searchFields,
        this.serarchFilter.keywords,
        this.sortField,
        moduleId || ''
      ).then((rep) => {
        if (rep.data.Code === 0) {
          this.total = rep.data.Data.total
          this.listData = rep.data.Data.rows
        }
        this.isloading = false
      })
    },
    add () {
      this.formTitle = '新增权限'
      if (!this.formData.ModuleID) {
        this.$message({
          message: '请选择模块',
          type: 'error'
        })
        return
      }
      if (this.listData.length > 0) {
        this.formData = { 'ModuleKey': this.listData[0].ModuleKey, 'ModuleId': this.listData[0].ModuleId }
      }
      this.editVisible = true
    },
    edit () {
      this.formTitle = '修改权限'
      this.editVisible = true
    },
    innerEdit (rowData) {
      this.formData = Object.assign({}, rowData)
      this.edit()
    },
    innerDel (rowData) {
      this.$confirm('请确认是否删除选中的数据？', '系统提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.isloading = true
        deletePermission(rowData.Id).then((rep) => {
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
    formatterSex (item) {
      return item.Sex === 1 ? '男' : item.Sex === 2 ? '女' : ''
    },
    search (keyword) {
      this.currentPage = 1
      this.serarchFilter.keywords = keyword
      this.loadData()
    },
    formCallBack (data) {
      this.editVisible = false
      if (data) {
        this.currentPage = 1
        this.loadData(this.formData.ModuleID)
      }
    },
    tableResize (val) {
      this.tableMaxHeight = val
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
