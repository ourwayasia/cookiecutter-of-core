<template>
  <div class="ts-task-todo">
    <div class="content-borderbox" :class="{'content-borderbox-simple':SimpleView}">
      <of-scroll ref="scroll" :top="146">
        <task-template></task-template>
        <task-template></task-template>
        <task-template></task-template>
        <task-template></task-template>
        <task-template></task-template>
      </of-scroll>
    </div>
  </div>
</template>

<script>

import OfScroll from '@/components/controls/of_scroll/of_scroll.vue'
import TaskTemplate from '@/modules/ts/pages/task/tasktemplate.vue'

export default {
  name: 'ts-task-todo',
  components: {
    OfScroll, TaskTemplate
  },
  data () {
    return {
      SimpleView: false
    }
  },
  mounted () {

  },
  methods: {
    toggleView (val) {
      this.SimpleView = val
      setTimeout(() => {
        this.$refs.scroll.$_refresh()
      }, 600)
    },
    toEdit (id) {
      id = '333222111'
      let path = '/ts/task/detail'
      path += '?id=' + id
      this.OpenWindow(path, true)
    }
  }
}
</script>

<style scoped>
</style>
