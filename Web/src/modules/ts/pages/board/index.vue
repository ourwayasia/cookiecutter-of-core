<template>
  <div class="ts-task-board">
    <of-scroll>
      <div class="content-board">
        <div class="content-board-top clearfix">
          <div class="board-top-text box-title-left">任务看板</div>
          <div class="box-title-right">
            <div class="btn btn-default btn-radius"><img src="@/assets/images/icon-more.png" />个性化</div>
          </div>
          <div class="form-group form-group-table box-title-right">
            <label class="control-label">时间范围</label>
            <div class="control-box">
              <el-date-picker type="date" format="yyyy-MM-dd" v-model="beginDate" value-format="yyyy-MM-dd" placeholder="选择开始时间"></el-date-picker>
              <!-- <div class="form-control-group">
                <input class="form-control" type="text" placeholder="">
                <i class="btn btn-default fa fa-calendar"></i>
              </div> -->
            </div>
            <label class="control-label">至</label>
            <div class="control-box">
              <el-date-picker type="date" format="yyyy-MM-dd" v-model="endDate" value-format="yyyy-MM-dd" placeholder="选择结束时间"></el-date-picker>
              <!-- <div class="form-control-group">
                <input class="form-control" type="text" placeholder="">
                <i class="btn btn-default fa fa-calendar"></i>
              </div> -->
            </div>
          </div>
        </div>
        <!--top-->
        <div class="content-board-main content-board-border clearfix">
          <div class="col-xs-3">
            <div class="content-box board-add" @click="onSearch">
              <i class="fa fa-plus"></i>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-1.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-2.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-3.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-4.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-5.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-6.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-1.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-2.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-3.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-4.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-5.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-6.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-3">
            <div class="content-box" @click="onDetail">
              <dl>
                <dt><img src="@/assets/images/icon-board-1.png"></dt>
                <dd>总经理办公会任务</dd>
              </dl>
              <div class="board-hoverbox">
                <div class="btn btn-default"><i class="fa fa-minus-circle"></i>移除</div>
                <div class="btn btn-default">设为默认</div>
              </div>
            </div>
          </div>
          <!--col-->
        </div>
        <!--main-->
      </div>
    </of-scroll>
  </div>
</template>

<script>

import OfScroll from '@/components/controls/of_scroll/of_scroll.vue'

export default {
  name: 'ts-task-board',
  components: {
    OfScroll
  },
  data () {
    return {
      beginDate: '',
      endDate: ''
    }
  },
  mounted () {

  },
  methods: {
    onDetail () {
      this.$router.push('/ts/board/detail')
    },
    onSearch () {
      this.$router.push('/ts/board/search')
    }
  }
}
</script>


<style scoped>
.ts-task-edit >>> input[type="file"] {
  display: none;
}
.el-date-editor.el-input,
.el-date-editor.el-input__inner {
  width: auto;
}
</style>
