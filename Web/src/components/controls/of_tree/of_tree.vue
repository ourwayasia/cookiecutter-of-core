<template>
  <div class="tree-nav">
    <el-row :gutter="10" class="tree-search">
      <el-col :span="17">
        <el-input v-show="enableSearch" placeholder="输入关键字" v-model="filterText" :disabled="isLoading" size="small">
          <i slot="prefix" class="el-input__icon el-icon-search"></i>
        </el-input>
      </el-col>
      <el-col :span="7" style="text-align:center">
        <el-button size="small" v-if="enableExpand" :icon="expandIcon" @click="expandAll()" :disabled="isLoading">
          {{expandText}}
        </el-button>
      </el-col>
    </el-row>
    <el-tree :data="listData" ref="ofTree" v-loading="isLoading" node-key="id" :filter-node-method="filterNode" :show-checkbox="multiple" :check-strictly="checkStrictly" @node-click="selectNode" @check-change="checkChange">
      <span class="tree-node" slot-scope="{ node, data }">
        <i v-show="showIcon" class="tree-node-icon" :class="iconClassName ? iconClassName : (data.icon?data.icon:'el-icon-menu')"></i>
        <span>{{ data.text }}</span>
      </span>
    </el-tree>
  </div>
</template>

<script>
export default {
  name: 'of-tree',
  props: {
    enableSearch: {
      type: Boolean,
      default: true
    },
    enableExpand: {
      type: Boolean,
      default: true
    },
    multiple: {
      type: Boolean,
      default: false
    },
    showFirstAll: {
      type: Boolean,
      default: true
    },
    showIcon: {
      type: Boolean,
      default: false
    },
    checkStrictly: {
      type: Boolean,
      default: false
    },
    iconClassName: {
      type: String,
      default: ''
    },
    url: {
      type: String,
      default: ''
    }
  },
  data () {
    return {
      listData: [],
      isLoading: false,
      filterText: '',
      expandIcon: 'el-icon-sort-down',
      expandText: '展开'
    }
  },
  watch: {
    filterText (val) {
      this.$refs.ofTree.filter(val)
    }
  },
  mounted () {
    this.loadTreeData()
  },
  methods: {
    loadTreeData () {
      if (!this.url) return
      this.isLoading = true
      this.$http.post(this.url).then((rep) => {
        if (rep.data.Code === 0) {
          if (this.showFirstAll) {
            rep.data.Data.unshift({ id: 'all', text: '全部', icon: '', disabled: true, state: { selected: true } })
          }
          this.listData = rep.data.Data
        }
        this.isLoading = false
      })
    },
    filterNode (value, data) {
      if (!value) return true
      return data.text.indexOf(value) !== -1
    },
    // eslint-disable-next-line
    selectNode (data, n, e) {
      this.$emit('onSelectNode', data)
    },
    // eslint-disable-next-line
    checkChange (data, checked, indeterminate) {
      this.$emit('onCheckChange', data, checked)
    },
    expandAll () {
      this.isExpand = !this.isExpand
      this.expandIcon = this.isExpand ? 'el-icon-sort-up' : 'el-icon-sort-down'
      this.expandText = this.isExpand ? '收起' : '展开'
      for (var i = 0; i < this.$refs.ofTree.store._getAllNodes().length; i++) {
        this.$refs.ofTree.store._getAllNodes()[i].expanded = this.isExpand
      }
    },
    getCheckedNodes () {
      return this.$refs.ofTree.getCheckedNodes()
    },
    getCurrentNode () {
      return this.$refs.ofTree.getCurrentNode()
    }
  }
}
</script>

<style scoped>
.tree-node {
  font-size: 14px;
  padding-right: 8px;
}
.tree-search {
  margin-bottom: 10px;
}
</style>
