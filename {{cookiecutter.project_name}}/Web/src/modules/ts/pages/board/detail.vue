<template>
  <div class="ts-board-detail">
    <of-scroll>
      <div class="content-board">
        <div class="content-board-top clearfix">
          <div class="board-top-text box-title-left">董事会任务看板</div>
          <div class="box-title-right">
            <div class="btn btn-default btn-radius"><i class="fa fa-ellipsis-h"></i>查看更多</div>
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
        <div class="content-board-main clearfix">
          <div class="col-xs-6">
            <div class="content-box">
              <div class="content-box-chart">
                <dl class="box-chart-title clearfix">
                  <dt>任务总体情况</dt>
                  <dd>任务总数：<span>78</span></dd>
                </dl>
                <div class="box-chart-main" id="Chart-1"></div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-6">
            <div class="content-box">
              <div class="content-box-chart">
                <dl class="box-chart-title clearfix">
                  <dt>任务关闭率</dt>
                  <dd>关闭任务数：<span>78</span></dd>
                </dl>
                <div class="box-chart-main" id="Chart-2"></div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-6">
            <div class="content-box">
              <div class="content-box-chart">
                <dl class="box-chart-title clearfix">
                  <dt>任务按期关闭率</dt>
                  <dd>任务按期关闭数：<span>78</span></dd>
                </dl>
                <div class="box-chart-main" id="Chart-3"></div>
              </div>
            </div>
          </div>
          <!--col-->
          <div class="col-xs-6">
            <div class="content-box">
              <div class="content-box-chart">
                <dl class="box-chart-title clearfix">
                  <dt>任务延期情况</dt>
                  <dd>任务延期数：<span>78</span></dd>
                </dl>
                <div class="box-chart-main" id="Chart-4"></div>
              </div>
            </div>
          </div>
          <!--col-->
        </div>
        <!--main-->
      </div>
      <div style="height:150px"></div>
    </of-scroll>
  </div>
</template>

<script>

import OfScroll from '@/components/controls/of_scroll/of_scroll.vue'
import echarts from 'echarts'

export default {
  name: 'ts-board-detail',
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
    this.initChart1()
    this.initChart2()
    this.intiChart3()
    this.initChart4()
  },
  methods: {
    initChart1 () {
      let option1 = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        calculable: true,
        xAxis: [{
          type: 'category',
          data: ['1月', '2月', '3月', '4月', '5月', '6月']
        }],
        yAxis: [{
          type: 'value'
        }],
        series: [

          {
            name: '任务中',
            type: 'bar',
            barWidth: 20,
            stack: '任务总体',
            data: [620, 732, 701, 734, 1090, 1130]
          },
          {
            name: '任务完成',
            type: 'bar',
            stack: '任务总体',
            data: [120, 132, 101, 134, 290, 230]
          },
          {
            name: '任务延期',
            type: 'bar',
            stack: '任务总体',
            data: [60, 72, 71, 74, 190, 130]
          }
        ]
      };
      let myChart1 = echarts.init(document.getElementById('Chart-1'));
      myChart1.setOption(option1);
    },
    initChart2 () {
      let labelTop = {
        normal: {
          label: {
            show: true,
            position: 'center',
            formatter: '{b}',
            textStyle: {
              baseline: 'top',
              fontSize: 14
            }
          },
          labelLine: {
            show: false
          }
        }
      };
      let labelFromatter = {
        normal: {
          label: {
            formatter: function (params) {
              return 100 - params.value + '%'
            },
            textStyle: {
              baseline: 'bottom',
              fontSize: 20
            }
          }
        },
      }
      let labelBottom = {
        normal: {
          color: '#ccc',
          label: {
            show: true,
            position: 'center'
          },
          labelLine: {
            baseline: 'bottom',
            show: false
          }
        }
      };
      let radius = [50, 60];

      let option2 = {

        series: [{
          type: 'pie',
          center: ['20%', '50%'],
          radius: radius,
          x: '0%', // for funnel
          itemStyle: labelFromatter,
          data: [{
            name: 'other',
            value: 46,
            itemStyle: labelBottom
          },
          {
            name: '本日',
            value: 54,
            itemStyle: labelTop
          }
          ]
        },
        {
          type: 'pie',
          center: ['50%', '50%'],
          radius: radius,
          x: '20%', // for funnel
          itemStyle: labelFromatter,
          data: [{
            name: 'other',
            value: 56,
            itemStyle: labelBottom
          },
          {
            name: '本周',
            value: 44,
            itemStyle: labelTop
          }
          ]
        },
        {
          type: 'pie',
          center: ['80%', '50%'],
          radius: radius,
          x: '40%', // for funnel
          itemStyle: labelFromatter,
          data: [{
            name: 'other',
            value: 65,
            itemStyle: labelBottom
          },
          {
            name: '本月',
            value: 35,
            itemStyle: labelTop
          }
          ]
        }
        ]
      };
      let myChart2 = echarts.init(document.getElementById('Chart-2'));
      myChart2.setOption(option2);
    },
    intiChart3 () {

      let option3 = {
        tooltip: {
          trigger: 'axis'
        },
        calculable: true,
        xAxis: [{
          type: 'category',
          boundaryGap: false,
          data: ['1月', '2月', '3月', '4月', '5月', '6月']
        }],
        yAxis: [{
          type: 'value'
        }],
        series: [{
          name: '邮件营销',
          type: 'line',
          stack: '总量',
          data: [60, 72, 71, 74, 90, 30]
        }]
      };
      let myChart3 = echarts.init(document.getElementById('Chart-3'));
      myChart3.setOption(option3);
    },
    initChart4 () {

      let option4 = {
        tooltip: {
          trigger: 'axis'
        },
        calculable: true,
        xAxis: [{
          type: 'category',
          boundaryGap: false,
          data: ['1月', '2月', '3月', '4月', '5月', '6月']
        }],
        yAxis: [{
          type: 'value'
        }],
        series: [{
          name: '搜索引擎',
          type: 'line',
          stack: '总量',
          itemStyle: {
            normal: {
              areaStyle: {
                type: 'default'
              }
            }
          },
          data: [60, 72, 71, 74, 90, 30]
        }]
      };
      let myChart4 = echarts.init(document.getElementById('Chart-4'));
      myChart4.setOption(option4);
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