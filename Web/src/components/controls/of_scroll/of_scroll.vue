<template>
  <div ref="wrapper" class="of-scroll warpper" :style="{height:warpperHeight}">
    <div>
      <slot></slot>
    </div>
  </div>
</template>

<script>

import BScroll from 'better-scroll'

export default {
  name: 'of-scroll',
  props: {
    top: {
      type: Number,
      default: 0
    },
    bottom: {
      type: Number,
      default: 0
    },
    height: {
      type: String,
      default: ''
    },
    listdata: {
      type: [Object, Array],
      default: null
    }
  },
  data () {
    return {
      
    }
  },
  computed: {
    warpperHeight () {
      if(this.height) {
        return this.height
      }
      let clientHeight = document.documentElement.clientHeight
      return (clientHeight - this.top - this.bottom) + 'px'
    }
  },
  mounted () {
    this.$_init()
  },
  destroyed () {
    this.$_destroy()
  },
  methods: {
    $_init () {
      this.$nextTick(() => {
        this.scroll = new BScroll(this.$refs.wrapper, {
          click: true,
          mouseWheel: true,
          scrollbar: true
        })
      })
    },
    $_destroy () {
      this.scroll && this.scroll.destroy()
    },
    $_refresh () {
      this.scroll && this.scroll.refresh()
    },
    $_disable () {
      this.scroll && this.scroll.disable()
    },
    $_enable () {
      this.scroll && this.scroll.enable()
    }
  },
  watch: {
    listdata () {
      if (!this.scroll) {
        return
      }
      this.$nextTick(() => {
        this.scroll.refresh()
      })
    },
    height () {
      if (!this.scroll) {
        return
      }
      this.$nextTick(() => {
        this.scroll.refresh()
      })
    }
  }
}
</script>

<style scoped>
.warpper
{
  overflow:hidden;
}
</style>
