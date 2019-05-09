<template>
  <div class="config-list">
    <of-page mode="list">
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
        <el-table border highlight-current-row style="width: 100%" header-cell-class-name="header-row" :data="listData" :max-height="500" v-loading="isloading" @selection-change='onSelectionChange'>
          <el-table-column type="selection" width="55" align="center"> </el-table-column>
          <el-table-column prop="ConfigKey" label="配置键" sortable></el-table-column>
          <el-table-column prop="ConfigName" label="配置名称" sortable></el-table-column>
          <el-table-column prop="ConfigValue" label="配置值" sortable></el-table-column>
          <el-table-column label="操作" width="150" align="center" header-align="center">
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
    </of-page>
    <config-edit v-if="formVisible" :dataForm="formData" :formTitle="formTitle" @formCallBack="formCallBack"></config-edit>
  </div>
</template>

<script>
import OfPage from '@/components/base/of_page/of_page'
import OfSearch from '@/components/controls/of_search/of_search'
import ConfigEdit from '@/modules/sys/pages/config/edit'
import OfPagination from '@/components/controls/of_pagination/of_pagination'

import { queryConfig, deleteConfig } from '@/modules/sys/api/config.js'

export default {
  name: 'sys-config-list',
  data () {
    return {
      title: '配置列表页',
      listData: [],
      total: 0,
      currentPage: 1,
      pageSize: 15,
      sortOrder: 'asc',
      searchFields: 'ConfigName,ConfigKey',
      serarchFilter: {
        keywords: ''
      },
      formVisible: false,
      formTitle: '',
      formData: {},
      isDelete: true,
      batchId: '',
      isloading: false
    }
  },
  components: {
    ConfigEdit,
    OfPage,
    OfSearch,
    OfPagination
  },
  mounted () {
    this.loadData()
  },
  methods: {
    loadData () {
      this.isloading = true
      queryConfig(
        this.pageSize,
        this.currentPage,
        this.sortOrder,
        this.searchFields,
        this.serarchFilter.keywords
      ).then((rep) => {
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
      this.formTitle = '新增配置'
      this.formData = {}
      this.formVisible = true
    },
    edit () {
      this.formTitle = '修改配置'
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
        deleteConfig(rowData.Id).then((rep) => {
          if (rep.data.Code === 0) {
            this.$message({
              message: '删除成功',
              type: 'success'
            })
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
