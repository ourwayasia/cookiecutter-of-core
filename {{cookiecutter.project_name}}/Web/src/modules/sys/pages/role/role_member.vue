<template>
  <of-dialog :title="formTitle" @onCancel="cancel" :isConfirm="isConfirm" @onDialogResize="dialogResize" width="60%">
    <div slot="content">
      <of-page mode="list">
        <div slot="toolBar">
          <el-button-group>
            <el-button v-access:add icon="el-icon-plus" @click="addEmployee" size="small" :disabled="isLoading">添加人员</el-button>
            <el-button v-access:add icon="el-icon-plus" size="small" :disabled="isLoading" @click="addDepartment">添加部门</el-button>
            <el-button v-access:del icon="el-icon-delete" size="small" :disabled="isDelete" @click="batchDel">删除</el-button>
          </el-button-group>
        </div>
        <div slot="searchBar">
          <of-search @search="search"></of-search>
        </div>
        <div>
          <el-table border highlight-current-row style="width: 100%" header-cell-class-name="header-row" :data="listData" :max-height="tableHeight" v-loading="isLoading" @selection-change='onSelectionChange'>
            <el-table-column type="selection" width="55" align="center"> </el-table-column>
            <el-table-column prop="MemberName" label="名称" sortable></el-table-column>
            <el-table-column prop="MemberType" label="类型" sortable :formatter="formatterMemberType"></el-table-column>
            <el-table-column label="操作" width="100" align="center" header-align="center">
              <template slot-scope="scope">
                <el-button @click="innerDel(scope.row)" type="text" size="mini">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div class="pagination-wapper">
            <of-pagination :total="total" :pageSize="pageSize" :currentPage="currentPage" @onSizeChange="handleSizeChange" @onCurrentChange="handleCurrentChange">
            </of-pagination>
          </div>
        </div>
      </of-page>
      <department-picker v-if="departmentVisible" :multiple="true" :checkStrictly="true" @pickerCallBack="departmentCallBack"></department-picker>
      <employee-picker v-if="employeeVisible" :multiple="true" @pickerCallBack="employeeCallBack"></employee-picker>
    </div>
    <div slot="footer-operation">
      <el-button @click.native="cancel" :disabled="isConfirm">返 回</el-button>
    </div>
  </of-dialog>
</template>
<script>

import OfDialog from '@/components/controls/of_dialog/of_dialog'
import OfPage from '@/components/base/of_page/of_page'
import OfSearch from '@/components/controls/of_search/of_search'
import OfPagination from '@/components/controls/of_pagination/of_pagination'
import DepartmentPicker from '@/modules/sys/components/picker/department'
import EmployeePicker from '@/modules/sys/components/picker/employee'

import { loadRoleMemberData, deleteRoleMember, saveRoleMember } from '@/modules/sys/api/role.js'


export default {
  name: 'sys-role-permission',
  props: {
    dataForm: {
      type: Object,
      default: null
    },
    formTitle: {
      type: String,
      default: ''
    }
  },
  data () {
    return {
      isConfirm: false,
      isLoading: false,
      listData: [],
      total: 0,
      currentPage: 1,
      pageSize: 15,
      sortOrder: 'asc',
      searchFields: 'MemberName',
      serarchFilter: {
        keywords: ''
      },
      departmentVisible: false,
      employeeVisible: false,
      isDelete: true,
      tableHeight: 300,
      batchId: []
    }
  },
  components: {
    OfDialog,
    OfPage,
    OfSearch,
    OfPagination,
    DepartmentPicker,
    EmployeePicker
  },
  mounted () {
    this.loadData()
  },
  methods: {
    loadData () {
      this.isLoading = true
      loadRoleMemberData(
        this.dataForm.Id,
        this.currentPage,
        this.pageSize,
        this.sortOrder,
        this.searchFields,
        this.serarchFilter.keywords, 'id').then((rep) => {
          if (rep.data.Code === 0) {
            this.total = rep.data.Data.total
            this.listData = rep.data.Data.rows
          }
          this.isLoading = false
        })
    },
    addEmployee () {
      this.employeeVisible = true
    },
    addDepartment () {
      this.departmentVisible = true
    },
    innerDel (rowData) {
      this.$confirm('请确认是否删除选中的数据？', '系统提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.isConfirm = true
        this.isLoading = true
        deleteRoleMember(rowData.Id).then((rep) => {
          this.isConfirm = false
          this.isLoading = false
          if (rep.data.Code === 0) {
            this.$message({
              message: '删除成功',
              type: 'success'
            })
            this.search('')
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
    search (keyword) {
      this.currentPage = 1
      this.serarchFilter.keywords = keyword
      this.loadData()
    },
    formatterMemberType (item) {
      switch (item.MemberType) {
        case 1:
          return '人员'
        case 2:
          return '部门'
        default:
          return ''
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
    },
    cancel () {
      this.$emit('formCallBack', null)
    },
    save (items) {
      this.isConfirm = true
      this.isLoading = true
      saveRoleMember(items, this.dataForm.Id).then((rep) => {
        this.isConfirm = false
        this.isLoading = false

        if (rep.data.Code === 0) {
          this.$message({
            message: '提交成功',
            type: 'success'
          })
          this.search('')
        } else {
          this.$message({
            message: rep.data.Message,
            type: 'error'
          })
        }
      }).catch((e) => {
        this.isConfirm = false
        this.$message({
          message: e.toString(),
          type: 'error'
        })
      })
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
    departmentCallBack (val) {
      this.departmentVisible = false
      if (val) {
        let departmentData = []
        val.forEach(x => {
          departmentData.push({
            RoleId: this.dataForm.Id,
            MemberType: 2,
            MemberName: x.text,
            MemberId: x.id
          })
        })
        this.save(departmentData)
      }
    },
    employeeCallBack (val) {
      this.employeeVisible = false
      if (val) {
        let employeeData = []
        val.forEach(x => {
          employeeData.push({
            RoleId: this.dataForm.Id,
            MemberType: 1,
            MemberName: x.RealName,
            MemberId: x.Id
          })
        })
        this.save(employeeData)
      }
    },
    dialogResize (height) {
      this.tableHeight = height - 120
    }
  }
}
</script>

<style scoped>
</style>
