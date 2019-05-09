<template>
  <div class="config-list">
    <of-page mode="list-form">
      <div slot="leftArea">
        <div class="department-nav">
          <el-tree :data="dictionaryTreeData" ref="departmentTree" v-loading="isTreeLoading" node-key="id" @node-click="selectNode">
            <span class="department-node" slot-scope="{ node, data }">
              <span>{{ data.text }}</span>
              <span class="department-opear" v-show="currentSelectId === data.id">
                <i v-access:modify class="el-icon-edit" title="修改" @click.stop="(n) => editNode(data,node)"></i>
                <i v-access:delete class="el-icon-delete" title="删除" @click.stop="(n) => removeNode(data,node)"></i>
              </span>
            </span>
          </el-tree>
        </div>
      </div>
      <div slot="toolBar">
        <el-button-group>
          <el-button v-access:add icon="el-icon-plus" @click="add" size="small" :disabled="isloading">新增</el-button>
          <el-button v-access:delete icon="el-icon-delete" size="small" :disabled="isDelete" @click="batchDel">删除</el-button>
        </el-button-group>
      </div>
      <div slot="searchBar">
        <of-search @search="search"></of-search>
      </div>
      <div slot="content">
        <el-table border highlight-current-row style="width: 100%" header-cell-class-name="header-row" :data="listData" :max-height="500" v-loading="isloading" @selection-change='onSelectionChange'>

          <el-table-column type="selection" width="55" align="center"> </el-table-column>
          <el-table-column prop="ItemText" label="字典名称" sortable></el-table-column>
          <el-table-column prop="ItemKey" label="字典键名" sortable></el-table-column>
          <el-table-column prop="ItemValue" label="字典键值" sortable></el-table-column>
          <el-table-column prop="SortNum" width="100" label="排序号" sortable></el-table-column>
          <el-table-column prop="Status" width="100" label="状态" sortable :formatter="formatterStatus"></el-table-column>
          <el-table-column label="操作" width="120" align="center" header-align="center">
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
    <dictionary-edit v-if="formVisible" :dataForm="formData" :formTitle="formTitle" @formCallBack="formCallBack"></dictionary-edit>
  </div>
</template>

<script>
import OfPage from '@/components/base/of_page/of_page'
import OfSearch from '@/components/controls/of_search/of_search'
import DictionaryEdit from '@/modules/sys/pages/dictionary/edit'
import OfPagination from '@/components/controls/of_pagination/of_pagination'

import { queryDictionary, loadJsTreeNodes, deleteDictionary } from '@/modules/sys/api/dictionary.js'


export default {
  name: 'sys-dictionary-list',
  data () {
    return {
      title: '配置列表页',
      listData: [],
      dictionaryTreeData: [],
      parentListData: [],
      total: 0,
      currentPage: 1,
      pageSize: 15,
        sortField: 'SortNum',
      sortOrder: 'asc',
      searchFields: 'ItemText,ItemKey,ItemValue',
      serarchFilter: {
        keywords: ''
      },
      formVisible: false,
      formTitle: '',
      formData: {},
      isDelete: true,
      batchId: '',
      isloading: false,
      isTreeLoading: false,
      currentSelectId: ''
    }
  },
  components: {
    DictionaryEdit,
    OfPage,
    OfSearch,
    OfPagination
  },
  mounted () {
    this.loadTreeData()
    // this.loadData()
  },
  methods: {
    loadData () {
      this.isloading = true
      queryDictionary(
        this.currentPage,
        this.pageSize,
        this.sortOrder,
        this.searchFields,
        this.serarchFilter.keywords,
        this.sortField,
        this.currentSelectId
      ).then((rep) => {
        if (rep.data.Code === 0) {
          this.total = rep.data.Data.total
          this.listData = rep.data.Data.rows
        }
        this.isloading = false
      })
    },
    loadTreeData () {
      this.isTreeLoading = true
      loadJsTreeNodes().then((rep) => {
        if (rep.data.Code === 0) {
          this.dictionaryTreeData = []
          rep.data.Data.forEach(x => {
            this.dictionaryTreeData.push({
              id: x.Id,
              text: x.ItemText,
              children: []
            })
          })
          this.parentListData = rep.data.Data
        }
        this.isTreeLoading = false
      })
    },
    search (keyword) {
      this.serarchFilter.keywords = keyword
      this.currentPage = 1
      this.loadData()
    },
    add () {
      this.formTitle = '新增字典'
      this.formData = {
        SortNum: 0,
        Status: 1,
        Options: []
      }
      // if (this.currentSelectId) {
      //   const nodeItem = this.dictionaryTreeData.find(x => x.id === this.currentSelectId)
      //   this.formData.ParentId = nodeItem.id
      //   this.formData.ParentName = nodeItem.text
      // }
      this.dictionaryTreeData.forEach(x => {
        this.formData.Options.push({
          ParentId: x.id,
          ParentName: x.text
        })
      })
      this.formVisible = true
    },
    edit () {
      this.formTitle = '修改字典'
      const nodeItem = this.dictionaryTreeData.find(x => x.id === this.formData.ParentId)
      if (nodeItem) {
        this.formData.ParentName = nodeItem.text
      }
      this.formData.Options = []
      this.dictionaryTreeData.forEach(x => {
        this.formData.Options.push({
          ParentId: x.id,
          ParentName: x.text
        })
      })
      this.formVisible = true
    },
    formCallBack (data) {
      this.formVisible = false
      if (data != null) {
        this.loadData()
        this.loadTreeData()
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
        deleteDictionary(rowData.Id).then((rep) => {
          if (rep.data.Code === 0) {
            this.$message({
              message: '删除成功',
              type: 'success'
            })
            if (!rowData.ParentId) {
              this.loadTreeData()
            }
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
    editNode (data, n) {
      this.innerEdit(this.parentListData.find(x => x.Id === data.id))
    },
    removeNode (data, n) {
      this.innerDel(this.parentListData.find(x => x.Id === data.id))
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
    formatterStatus (item) {
      return item.Status === 1 ? '已启用' : '已禁用'
    },
    selectNode (data, n, e) {
      this.currentSelectId = data.id
      this.search()
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
.department-node {
  font-size: 14px;
  padding-right: 8px;
}
.department-opear {
  position: absolute;
  right: 5px;
}
.department-opear > i:first-child {
  margin-right: 5px;
}
.department-search {
  margin-bottom: 10px;
}
.form-item {
  height: 40px;
}
</style>
