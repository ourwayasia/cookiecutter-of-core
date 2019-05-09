<template>
  <of-dialog title="人员选择器" :appendToBody="true" @onCancel="close" @onConfirm="confirm" confirmName="确 定" width="70%" @onDialogResize="dialogResize" :resizeTimeOut="200">
    <div slot="content">
      <of-page mode="list-form" :leftWidth="300">
        ` <div slot="leftArea" ref="leftArea">
          <department-tree ref="departmentTree" @onSelectNode="selectNode" :url="departmentUrl"></department-tree>
        </div>
        <div slot="toolBar">
          &nbsp;
        </div>
        <div slot="searchBar">
          <of-search @search="search" :showbutton="true"></of-search>
        </div>
        <div slot="content" ref="rightArea">
          <el-table border highlight-current-row style="width: 100%" header-cell-class-name="header-row" :data="listData" :max-height="tableHeight" v-loading="isloading" @selection-change="onSelectionChange" @row-click="onRowChange">
            <el-table-column v-if="multiple" type="selection" width="55" align="center"> </el-table-column>
            <el-table-column prop="EmployeeNo" label="工号" sortable></el-table-column>
            <el-table-column prop="RealName" label="姓名" sortable></el-table-column>
            <el-table-column prop="Sex" label="性别" width="80" align="center" :formatter="formatterSex" sortable></el-table-column>
            <el-table-column prop="DepartmentName" label="部门" sortable></el-table-column>
          </el-table>
          <of-pagination :total="total" :pageSize="pageSize" :currentPage="currentPage" @onSizeChange="handleSizeChange" @onCurrentChange="handleCurrentChange">
          </of-pagination>
        </div>
      </of-page>`
    </div>
  </of-dialog>
</template>

<script>
import DepartmentTree from '@/components/controls/of_tree/of_tree'
import OfPagination from '@/components/controls/of_pagination/of_pagination'
import OfDialog from '@/components/controls/of_dialog/of_dialog'
import OfPage from '@/components/base/of_page/of_page'
import OfSearch from '@/components/controls/of_search/of_search'

import { queryEmployee } from '@/modules/sys/api/employee.js'
import { loadJsTreeNodes } from '@/modules/sys/api/department.js'

export default {
  name: 'sys-employee-picker',
  props: {
    multiple: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      departmentList: [],
      filterText: '',
      isTreeLoading: false,
      isloading: false,
      isExpand: false,
      expandIcon: 'el-icon-sort-down',
      expandText: '展开全部',
      listData: [],
      total: 0,
      currentPage: 1,
      pageSize: 15,
      sortOrder: 'asc',
      searchFields: 'EmployeeNo,RealName,Spell',
      serarchFilter: {
        keywords: ''
      },
      multipleSelection: [],
      departmentUrl: '/Sys/Department/LoadJsTreeNodes',
      tableHeight: 300
    }
  },
  watch: {
    filterText (val) {
      this.$refs.departmentTree.filter(val)
    }
  },
  mounted () {
    this.loadTreeData()
    this.loadEmployeeData()
  },
  components: {
    DepartmentTree,
    OfPagination,
    OfDialog,
    OfPage,
    OfSearch
  },
  methods: {
    loadTreeData () {
      this.isTreeLoading = true
      loadJsTreeNodes().then((rep) => {
        if (rep.data.Code === 0) {
          rep.data.Data.unshift({ id: 'all', text: '全部', icon: '', state: { selected: true } })
          this.departmentList = rep.data.Data
        }
        this.isTreeLoading = false
      })
    },
    loadEmployeeData (departmentId) {
      this.isloading = true
      queryEmployee(this.currentPage, this.pageSize, this.sortOrder, this.searchFields, this.serarchFilter.keywords, departmentId || '').then((rep) => {
        if (rep.data.Code === 0) {
          this.total = rep.data.Data.total
          this.listData = rep.data.Data.rows
        }
        this.isloading = false
      })
    },
    selectNode (data, n, e) {
      this.currentPage = 1
      this.loadEmployeeData(data.id === 'all' ? '' : data.id)
    },
    filterNode (value, data) {
      if (!value) return true
      return data.text.indexOf(value) !== -1
    },
    expandAll () {
      this.isExpand = !this.isExpand
      this.expandIcon = this.isExpand ? 'el-icon-sort-up' : 'el-icon-sort-down'
      this.expandText = this.isExpand ? '收起全部' : '展开全部'
      for (var i = 0; i < this.$refs.departmentTree.store._getAllNodes().length; i++) {
        this.$refs.departmentTree.store._getAllNodes()[i].expanded = this.isExpand
      }
    },
    close () {
      this.$emit('pickerCallBack', null)
    },
    confirm () {
      if (this.multipleSelection.length === 0) {
        this.$message({
          message: '请选择人员',
          type: 'warning'
        })
      } else {
        this.multipleSelection.map(x => {
          x.Password = ''
        })
        this.$emit('pickerCallBack', this.multiple ? this.multipleSelection : this.multipleSelection[0])
      }
    },
    search (keyword) {
      this.currentPage = 1
      this.serarchFilter.keywords = keyword
      this.loadEmployeeData()
    },
    handleSizeChange (val) {
      this.currentPage = 1
      this.pageSize = val
      this.loadEmployeeData()
    },
    handleCurrentChange (val) {
      if (this.total > this.pageSize) {
        this.currentPage = val
        this.loadEmployeeData()
      }
    },
    onSelectionChange (val) {
      this.multipleSelection = val
    },
    onRowChange (row, event, column) {
      if (!this.multiple) {
        this.multipleSelection = []
        this.multipleSelection.push(row)
      }
    },
    formatterSex (item) {
      return item.Sex === 1 ? '男' : item.Sex === 2 ? '女' : ''
    },
    dialogResize (height) {
      this.tableHeight = height - 140
      let leftArea = this.$refs.leftArea.parentElement
      let rightArea = this.$refs.rightArea.parentElement.parentElement

      height -= 40
      if (leftArea) {
        leftArea.style.maxHeight = `${height}px`
        leftArea.style.minHeight = `${height}px`
      }
      if (rightArea) {
        rightArea.style.maxHeight = `${height}px`
        rightArea.style.minHeight = `${height}px`
      }
    }
  }
}
</script>
<style scoped>
</style>
