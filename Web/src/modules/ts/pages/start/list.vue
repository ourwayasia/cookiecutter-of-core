<template>
  <of-scroll :top="146">
    <div class="content-box" v-for="(item,index) in taskTypeTree" :key="index">
      <template v-if="item.children&&item.children.length>0">
        <div class="content-box-title no-border">
          <div class="box-title-text">{{item.text}}</div>
        </div>
        <div class="content-box-blockmenu">
          <ul class="clearfix">
            <li class="col-xs-3" v-for="(child,i) in item.children" :key="i" @click="createTask(child.id)">
              <a>{{child.text}}</a>
            </li>
          </ul>
        </div>
      </template>
    </div>
  </of-scroll>
</template>
<script>

import OfScroll from '@/components/controls/of_scroll/of_scroll.vue'
import { loadTaskTypeTree } from '@/modules/ts/api/taskstart.js'

export default {
  name: 'ts-task-start',
  components: {
    OfScroll
  },
  data () {
    return {
      taskTypeTree: []
    }
  },
  mounted () {
    this.loadTypeTree()
  }
  ,
  methods: {
    loadTypeTree () {
      loadTaskTypeTree().then(x => {
        if (x.data.Code !== 0) {
          this.$message.error(x.data.Message)
          return
        }
        this.taskTypeTree = x.data.Data
      })
    },
    createTask (id) {
      this.OpenWindow('/ts/task/edit?tid=' + id, true)
    }
  }
}
</script>

