<template>
  <div class="of-page content-box">
    <div v-if="mode==='default'">
      <div class="default">
        <div class="content">
          <slot></slot>
        </div>
      </div>
    </div>
    <div v-if="mode==='list'">
      <div class="list">
        <div class="tool-bar">
          <div class="search-bar">
            <slot name="searchBar"></slot>
          </div>
          <slot name="toolBar"></slot>
        </div>
        <div class="content">
          <slot></slot>
        </div>
        <div class="footer">
          <slot name="footer"></slot>
        </div>
      </div>
    </div>
    <div v-if="mode==='list-form'">
      <div class="list-form">
        <div class="left-area" :style="{'min-height':rightHeight,'max-height':rightHeight,'width':leftWidth+'px'}">
          <slot name="leftArea"></slot>
        </div>
        <div class="right-area" :style="{'min-height':rightHeight,'max-height':rightHeight,'marginLeft':leftWidth+'px'}">
          <div :class="toolBarClassName" ref="toolBarRef">
            <div class="right-area-searchbar">
              <slot name="searchBar"></slot>
            </div>
            <slot name="toolBar"></slot>
          </div>
          <div class="right-area-content">
            <slot name="content"></slot>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'of-page',
  props: {
    mode: {
      type: String,
      default: 'default'
    },
    leftWidth: {
      type: Number,
      default: 260
    }
  },
  data () {
    return {
      toolBarClassName: '',
      rightHeight: ''
    }
  },
  mounted () {
    if (this.mode === 'list-form') {
      if (this.$slots.toolBar) {
        const toolBarDoms = this.$slots.toolBar[0].children || []
        this.toolBarClassName = toolBarDoms.length > 0 ? 'right-area-toolbar' : ''
      }
      if (this.$slots.searchBar) {
        const searchbarDoms = this.$slots.searchBar[0].children || []
        this.toolBarClassName = searchbarDoms.length > 0 ? 'right-area-toolbar' : ''
      }
      setTimeout(() => {
        this.setRightHeight()
        window.addEventListener('resize', () => {
          this.setRightHeight()
        })
      }, 20)
    }
  },
  methods: {
    setRightHeight () {
      const clientHeight = window.innerHeight
      if (clientHeight && clientHeight !== undefined) {
        const toolBarHeight = this.$refs.toolBarRef ? this.$refs.toolBarRef.clientHeight : 0
        this.rightHeight = (clientHeight - 60 - 46) + 'px'
        this.$emit('tableResize', (clientHeight - toolBarHeight - 200))
      }
    }
  }
}
</script>

<style scoped>
/* default布局样式 开始 */
.default .content
{
  padding:10px 20px;
}
/* default布局样式 结束 */

/* list布局样式 开始 */
.list .tool-bar
{
  line-height:56px;
  box-sizing: border-box;
  padding:10px 20px;
}
.list .search-bar
{
  float:right;
}
.list .content
{
  padding:0px 20px 20px 20px;
}
/* list布局样式 结束 */

/* list-edit布局样式 开始 */
.list-form .left-area
{
  padding:20px;
  border-right: solid 1px #efefef;
  box-sizing: border-box;
  float: left;
  overflow: auto;
}
.list-form .right-area-toolbar
{
  line-height:56px;
  padding:0px 20px 0px 20px;
}

.list-form .right-area-searchbar
{
  float:right;
  clear: right;
}

.list-form .right-area-content
{
  padding:0px 10px 0px 20px;
  position: relative;
}

/* list-edit布局样式 结束 */

</style>
