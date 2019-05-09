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
          <el-table-column prop="RoleName" label="角色名称" sortable></el-table-column>
          <el-table-column prop="SortNum" label="排序号" sortable></el-table-column>
          <el-table-column prop="Status" label="状态" sortable :formatter="formatterStatus"></el-table-column>
          <el-table-column label="操作" width="270" align="center">
            <template slot-scope="scope">
              <el-button v-access:modify @click="innerEdit(scope.row)" type="text" size="mini">编辑</el-button>
              <el-button v-access:modify @click="innerPermission(scope.row)" type="text" size="mini">权限管理</el-button>
              <el-button v-access:modify @click="innerMember(scope.row)" type="text" size="mini">角色成员</el-button>
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
    <role-edit v-if="formVisible" :dataForm="formData" :formTitle="formTitle" @formCallBack="formCallBack"></role-edit>
    <role-permission v-if="permissionVisible" :formTitle="permissionTitle" :dataForm="formData" @formCallBack="permissionVisible=false"></role-permission>
    <role-member v-if="memberVisible" :formTitle="memberTitle" :dataForm="formData" @formCallBack="memberVisible=false"></role-member>
  </div>
</template>

<script>
import OfPage from '@/components/base/of_page/of_page'
import OfSearch from '@/components/controls/of_search/of_search'
import RoleEdit from '@/modules/sys/pages/role/edit'
import RolePermission from '@/modules/sys/pages/role/role_permission'
import RoleMember from '@/modules/sys/pages/role/role_member'
import OfPagination from '@/components/controls/of_pagination/of_pagination'

import { queryRole, deleteRole } from '@/modules/sys/api/role.js'


export default {
  name: 'sys-role-list',
  data () {
    return {
      title: '角色列表页',
      listData: [],
      total: 0,
      currentPage: 1,
      pageSize: 15,
        sortField: 'SortNum',
      sortOrder: 'asc',
      searchFields: 'RoleName',
      serarchFilter: {
        keywords: ''
      },
      formVisible: false,
      formTitle: '',
      formData: {},
      isDelete: true,
      batchId: '',
      isloading: false,
      permissionTitle: '权限管理',
      permissionVisible: false,
      memberVisible: false,
      memberTitle: '角色成员'
    }
  },
  components: {
    RoleEdit,
    OfPage,
    OfSearch,
    OfPagination,
    RolePermission,
    RoleMember
  },
  mounted () {
    this.loadData()
  },
  methods: {
    loadData () {
      this.isloading = true
      queryRole(
        this.currentPage,
        this.pageSize,
        this.sortOrder,
        this.sortField,
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
    formatterStatus (item) {
      return item.Status === 1 ? '已启用' : '已禁用'
    },
    add () {
      this.formTitle = '新增角色'
      this.formData = {
        Status: 0,
        SortNum: 0
      }
      this.formVisible = true
    },
    edit () {
      this.formTitle = '修改角色'
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
        this.isloading = true
        deleteRole(rowData.Id).then((rep) => {
          this.isloading = false
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
    innerPermission (rowData) {
      this.formData = Object.assign({}, rowData)
      this.permissionVisible = true
    },
    innerMember (rowData) {
      this.formData = Object.assign({}, rowData)
      this.memberVisible = true
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
