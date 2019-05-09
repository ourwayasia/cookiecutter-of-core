<template>
  <div class="config-list">
    <base-page mode="list">
      <div slot="toolBar">
        <el-button-group>
          <el-button v-access:add icon="el-icon-plus" @click="add" size="small" :disabled="isloading">新增</el-button>
          <el-button v-access:delete icon="el-icon-delete" size="small" :disabled="isDelete" @click="batchDel">删除</el-button>
        </el-button-group>
      </div>
      <div slot="searchBar">
        <of-search @search="search"></of-search>
      </div>
      <div>
        <el-table border highlight-current-row style="width: 100%" :header-cell-class-name="headerRow" :data="listData" :max-height="500" v-loading="isloading" @selection-change='onSelectionChange'>
          <el-table-column type="selection" width="55" align="center"> </el-table-column>
          <el-table-column prop="ModuleKey" label="模块标识" sortable></el-table-column>
          <el-table-column prop="ModuleName" label="模块名称" sortable></el-table-column>
          <el-table-column prop="ApplicationName" label="应用名称" sortable></el-table-column>
          <el-table-column label="操作" width="150" align="center">
            <template slot-scope="scope">
              <el-button v-access:modify @click="innerEdit(scope.row)" type="text" size="mini">编辑</el-button>
              <el-button v-access:delete @click="innerDel(scope.row)" type="text" size="mini">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        <div class="pagination-wapper">
          <of-pagination :total="total" :pageSize="pageSize" :currentPage="currentPage" @onSizeChange="handleSizeChange" @onCurrentChange="handleCurrentChange">
          </of-pagination>
        </div>
      </div>
    </base-page>
    <module-edit v-if="formVisible" :dataForm="formData" :formTitle="formTitle" @formCallBack="formCallBack"></module-edit>
  </div>
</template>

<script>
import ModuleEdit from '@/modules/sys/pages/module/edit'
import BasePage from '@/components/base/of_page/of_page'
import OfSearch from '@/components/controls/of_search/of_search'
import OfPagination from '@/components/controls/of_pagination/of_pagination'

import { queryModule, deleteModule } from '@/modules/sys/api/module.js'

export default {
  name: 'sys-module-list',
  data () {
    return {
      title: '模块管理列表',
      listData: [],
      total: 0,
      currentPage: 1,
      pageSize: 15,
      sortOrder: 'asc',
      searchFields: 'ModuleName,ModuleKey,ApplicationName',
      serarchFilter: {
        keywords: ''
      },
      formVisible: false,
      formTitle: '',
      formData: {},
      isDelete: true,
      batchId: '',
      isloading: false,
      headerRow: 'header-row'
    }
  },
  components: {
    ModuleEdit,
    BasePage,
    OfSearch,
    OfPagination
  },
  mounted () {
    this.loadData()
  },
  methods: {
    loadData () {
      this.isloading = true
      queryModule(
        this.currentPage,
        this.pageSize,
        this.sortOrder,
        this.searchFields,
        this.serarchFilter.keywords)
        .then((rep) => {
          if (rep.data.Code === 0) {
            this.total = rep.data.Data.total
            this.listData = rep.data.Data.rows
          }
          this.isloading = false
        })
    },
    search (keyword) {
      this.serarchFilter.keywords = keyword
      this.currentPage = 1
      this.loadData()
    },
    add () {
      this.formTitle = '新增模块'
      this.formData = {}
      this.formVisible = true
    },
    edit () {
      this.formTitle = '修改模块'
      this.formVisible = true
    },
    formCallBack (data) {
      this.formVisible = false
      if (data != null) {
        this.loadData()
      }
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
        deleteModule(rowData.Id).then((rep) => {
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
    onSelectionChange (rowItems) {
      this.isDelete = !rowItems.length > 0
      if (rowItems.length) {
        const ids = []
        for (var i = 0; i < rowItems.length; i++) {
          ids.push(rowItems[i].Id)
        }
        this.batchId = ids.join(',')
      }
    }
  }
}
</script>

<style scoped>
</style>
