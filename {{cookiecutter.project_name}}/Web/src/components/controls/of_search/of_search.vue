<template>
  <div class="of-search" :style="{'width':width}">
    <el-input :placeholder="placeholder" size="small" prefix-icon="el-icon-search" v-model="keywords" @input="search">
      <el-button slot="append" v-if="showbutton" @click="search">查找</el-button>
      <!-- <el-button v-if="advanced" slot="append" @click="toggle">高级</el-button> -->
    </el-input>
    <div v-show="showAdvanced" class="advance-mask" @click="showAdvanced=!showAdvanced"></div>
    <el-card v-show="showAdvanced" class="box-card advance-form">
      <div slot="header" class="clearfix">
        <span>暂时未实现高级搜索</span>
      </div>
      暂时未实现高级搜索
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'of-search',
  props: {
    width: {
      type: String,
      default: '300px'
    },
    placeholder: {
      type: String,
      default: '关键字...'
    },
    advanced: {
      type: Boolean,
      default: false
    },
    showbutton: {
      type: Boolean,
      default: false
    },
    options () {
      return {
        type: Array,
        default: []
      }
    }
  },
  data () {
    return {
      keywords: '',
      showAdvanced: false
    }
  },
  methods: {
    search () {
      if (this.timer) {
        clearTimeout(this.timer)
      }
      this.timer = setTimeout(() => {
        this.$emit('search', this.keywords)
      }, 800)
    },
    toggle () {
      this.showAdvanced = !this.showAdvanced
    }
  }
}
</script>

<style scoped>
.advance-mask {
  position: fixed;
  top: 0px;
  left: 0px;
  right: 0px;
  bottom: 0px;
  background-color: red;
  color: white;
  z-index: 998;
  opacity: 0.5;
}
.advance-form {
  position: fixed;
  top: 20%;
  left: 20%;
  width: 500px;
  height: 300px;
  z-index: 999;
}
</style>
