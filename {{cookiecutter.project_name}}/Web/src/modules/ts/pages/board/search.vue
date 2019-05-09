<template>
  <div class="ts-task-board">
    <of-scroll>
      <div class="content-board">
        <div class="content-board-top clearfix">
          <div class="board-top-text box-title-left">综合查询</div>
          <div class="box-title-right">
            <div class="btn btn-default btn-radius"><img src="@/assets/images/icon-more.png">个性化</div>
          </div>
          <div class="box-title-right hoverdown">
            <div class="btn btn-default btn-radius hoverdown-name">切换<i class="fa"></i></div>
            <div class="hoverdown-menu">
              <ul class="hoverdown-menu-content">
                <li><img src="@/assets/images/icon-board-1.png">看板首页</li>
                <li><img src="@/assets/images/icon-board-2.png">总经理办公室</li>
                <li><img src="@/assets/images/icon-board-3.png">董事会</li>
                <li><img src="@/assets/images/icon-board-4.png">领导指示</li>
                <li><img src="@/assets/images/icon-board-5.png">其他会议</li>
                <li><img src="@/assets/images/icon-board-6.png">审计整改</li>
              </ul>
            </div>
          </div>
        </div>
        <!--top-->
        <div class="content-box">
          <div class="content-search">
            <div class="clearfix">
              <div class="form-group col-xs-3">
                <label class="control-label"><span>主办人</span></label>
                <div class="control-box">
                  <div class="form-control-group">
                    <input class="form-control" type="text" placeholder="">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                </div>
              </div>
              <div class="form-group col-xs-3">
                <label class="control-label"><span>主办单位</span></label>
                <div class="control-box">
                  <select class="form-control">
                    <option selected="" hidden="">请选择主办单位</option>
                    <option>Item1</option>
                    <option>Item2</option>
                  </select>
                </div>
              </div>
              <div class="form-group col-xs-3">
                <label class="control-label"><span>任务布置人</span></label>
                <div class="control-box">
                  <div class="form-control-group">
                    <input class="form-control" type="text" placeholder="">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                </div>
              </div>
              <div class="form-group col-xs-3">
                <label class="control-label"><span>录入人</span></label>
                <div class="control-box">
                  <div class="form-control-group">
                    <input class="form-control" type="text" placeholder="">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                </div>
              </div>
              <div class="form-group col-xs-3">
                <label class="control-label"><span>任务名称</span></label>
                <div class="control-box">
                  <input class="form-control" type="text" placeholder="">
                </div>
              </div>
              <div class="form-group col-xs-3">
                <label class="control-label"><span>任务类型</span></label>
                <div class="control-box">
                  <select class="form-control">
                    <option selected="" hidden="">请选择任务类型</option>
                    <option>Item1</option>
                    <option>Item2</option>
                  </select>
                </div>
              </div>
              <div class="form-group col-xs-3">
                <label class="control-label"><span>任务状态</span></label>
                <div class="control-box">
                  <select class="form-control">
                    <option selected="" hidden="">请选择任务状态</option>
                    <option>Item1</option>
                    <option>Item2</option>
                  </select>
                </div>
              </div>
              <div class="form-group col-xs-3">
                <label class="control-label"><span>超期天数</span></label>
                <div class="control-box">
                  <div class="form-control-group">
                    <input class="form-control" type="text" placeholder="">
                    <i class="disabled">天</i>
                  </div>
                </div>
              </div>
              <div class="form-group col-xs-3">
                <label class="control-label"><span>未录入进展次数</span></label>
                <div class="control-box">
                  <div class="form-control-group">
                    <input class="form-control" type="text" placeholder="">
                    <i class="disabled">次</i>
                  </div>
                </div>
              </div>
            </div>
            <!--row-->
            <div class="clearfix">
              <div class="form-group col-xs-6 form-group-table">
                <label class="control-label"><span>开始时间</span></label>
                <div class="control-box">
                  <div class="form-control-group">
                    <input class="form-control" type="text" placeholder="">
                    <i class="btn btn-default fa fa-calendar"></i>
                  </div>
                </div>
                <label class="control-label">
                  <font>至</font>
                </label>
                <div class="control-box">
                  <div class="form-control-group">
                    <input class="form-control" type="text" placeholder="">
                    <i class="btn btn-default fa fa-calendar"></i>
                  </div>
                </div>
              </div>
              <div class="form-group col-xs-6 form-group-table">
                <label class="control-label"><span>结束时间</span></label>
                <div class="control-box">
                  <div class="form-control-group">
                    <input class="form-control" type="text" placeholder="">
                    <i class="btn btn-default fa fa-calendar"></i>
                  </div>
                </div>
                <label class="control-label">
                  <font>至</font>
                </label>
                <div class="control-box">
                  <div class="form-control-group">
                    <input class="form-control" type="text" placeholder="">
                    <i class="btn btn-default fa fa-calendar"></i>
                  </div>
                </div>
              </div>
            </div>
            <!--row-->
            <div class="clearfix">
              <div class="search-left">
                <div class="btn btn-primary">查询</div>
                <div class="btn btn-default">重置</div>
                <div class="btn btn-default">保存查询条件</div>
              </div>
              <div class="search-right">
                <div class="ctrl-btn close-search-btn">收起高级查询<i class="fa fa-angle-double-up"></i></div>
                <div class="ctrl-btn open-search-btn">展开高级查询<i class="fa fa-angle-double-down"></i></div>
              </div>
            </div>
            <!--row-->
          </div>
        </div>
        <!--box-->
        <div class="content-box content-table-page" style="padding-top: 10px;">
          <div class="content-table">
            <table cellpadding="0" cellspacing="0">
              <thead>
                <tr>
                  <th width="5%" class="text-center">序号</th>
                  <th width="10%">任务标题</th>
                  <th width="15%">主办单位</th>
                  <th width="10%">主办人</th>
                  <th width="10%">新计划完成期限</th>
                  <th width="10%">任务开始时间</th>
                  <th width="10%">任务关闭时间</th>
                  <th width="10%">状态</th>
                  <th width="10%" class="text-center">状态灯</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-center">1</td>
                  <td>新厂建设方案</td>
                  <td>战略规划部</td>
                  <td>李旭东</td>
                  <td>2018/04/29</td>
                  <td>2019/05/15</td>
                  <td>2019/06/01</td>
                  <td>超期关闭</td>
                  <td>
                    <div class="status-lamp status-1"></div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="content-table-footer clearfix">
            <div class="table-footer-ctrl">
              <div class="btn btn-primary">导出</div>
              <div class="btn btn-default">自定义报表</div>
            </div>
            <div class="content-pagination">
              <div class="content-pagination-part">
                <font>每页</font>
                <select>
                  <option>5</option>
                  <option>10</option>
                  <option>15</option>
                  <option>20</option>
                </select>
                <font>条</font>
              </div>
              <div class="content-pagination-part">
                <font>共8页</font>
              </div>
              <div class="content-pagination-part">
                <ul class="pagination">
                  <li class="disabled">
                    <a><i class="fa fa-angle-double-left"></i></a>
                  </li>
                </ul>
                <ul class="pagination">
                  <li>
                    <a><i class="fa fa-angle-left"></i></a>
                  </li>
                  <li class="active">
                    <a>1</a>
                  </li>
                  <li>
                    <a>2</a>
                  </li>
                  <li>
                    <a>3</a>
                  </li>
                  <li>
                    <a>4</a>
                  </li>
                  <li>
                    <a><i class="fa fa-angle-right"></i></a>
                  </li>
                </ul>
                <ul class="pagination">
                  <li>
                    <a><i class="fa fa-angle-double-right"></i></a>
                  </li>
                </ul>
              </div>
              <div class="content-pagination-part">
                <font>跳至</font>
                <input type="text">
                <font>页</font>
              </div>
            </div>
          </div>
        </div>
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

    }
  },
  mounted () {

  },
  methods: {

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
