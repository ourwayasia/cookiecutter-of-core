<template>
  <el-pagination class="pagination-wapper" @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="currentPage" :page-sizes="pageSizes" :page-size="pageSize" :layout="layout" :background="background" :total="total">
  </el-pagination>
</template>
<script>
export default {
  props: {
    pageSizes: {
      type: Array,
      default: () => [15, 30, 50, 100]
    },
    layout: {
      type: String,
      default: 'total, sizes, prev, pager, next, jumper'
    },
    currentPage: {
      type: Number,
      default: 0
    },
    pageSize: {
      type: Number,
      default: 15
    },
    total: {
      type: Number,
      default: 0
    },
    background: {
      type: Boolean,
      default: true
    }
  },
  methods: {
    handleSizeChange (val) {
      this.$emit('onSizeChange', val)
    },
    handleCurrentChange (val) {
      this.$emit('onCurrentChange', val)
    }
  }
}
</script>
<style scoped>
.pagination-wapper {
  margin-top: 15px;
  width: 100%;
  text-align: right;
  max-height: 30px;
}
</style>
