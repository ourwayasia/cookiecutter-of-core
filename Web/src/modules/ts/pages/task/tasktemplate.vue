<template>
  <div class="content-borderbox-item color-green">
    <div class="content-borderbox-title">
      <div class="content-borderbox-name">
        <span>延期申请</span>
        <a @click="onEdit">关于集团报废电脑等办公设备、体育设施等物资的再利用建议</a>
      </div>
      <div class="content-borderbox-info clearfix">
        <div class="borderbox-info-item show hoverdown">
          <span>主办：<a>
              <font>吴挺（CIT</font>
              <font> → </font>
              <font>仵晓蕗（CIT)</font>
            </a></span>
          <div class="hoverdown-menu">
            <ul class="hoverdown-menu-content">
              <li>陈泰（CIT）→ 王建东（CIT）</li>
              <li>吴挺（CIT）→ 仵晓蕗（CIT)</li>
            </ul>
          </div>
        </div>
        <!--infoitem-->
        <div class="borderbox-info-item">
          <span>任务编号：20181230003</span>
        </div>
        <!--infoitem-->
        <div class="borderbox-info-item">
          <span>类型：安质环委员会办公室</span>
        </div>
        <!--infoitem-->
        <div class="borderbox-info-item show">
          <span>完成期限：2018-12-30</span>
        </div>
        <!--infoitem-->
        <div class="borderbox-info-item">
          <div class="borderbox-info-progress">
            <div class="bar">
              <span style="width: 42%;"></span>
            </div>
            <div class="num">42%</div>
          </div>
        </div>
        <!--infoitem-->
      </div>
      <div class="content-borderbox-info simple-item clearfix">
        <div class="borderbox-info-item show hoverdown">
          <span>主办：<a>
              <font>吴挺（CIT</font>
              <font> → </font>
              <font>仵晓蕗（CIT)</font>
            </a></span>
          <div class="hoverdown-menu">
            <ul class="hoverdown-menu-content">
              <li>陈泰（CIT）→ 王建东（CIT）</li>
              <li>吴挺（CIT）→ 仵晓蕗（CIT)</li>
            </ul>
          </div>
        </div>
        <!--infoitem-->
        <div class="borderbox-info-item">
          <span>任务编号：20181230003</span>
        </div>
        <!--infoitem-->
        <div class="borderbox-info-item">
          <span>类型：安质环委员会办公室</span>
        </div>
        <!--infoitem-->
        <div class="borderbox-info-item show">
          <span>完成期限：2018-12-30</span>
        </div>
        <!--infoitem-->
        <div class="borderbox-info-item">
          <div class="borderbox-info-progress">
            <div class="bar">
              <span style="width: 42%;"></span>
            </div>
            <div class="num">42%</div>
          </div>
        </div>
        <!--infoitem-->
      </div>
      <!--info-->
    </div>
    <!--title-->
    <div class="content-borderbox-main">
      <div class="borderbox-main-item">
        <dl>
          <dt>任务内容：</dt>
          <dd>
            <span>目前股份公司重要会议比较多，重要会议均是纸质打印桌签，会议前至少一天准备齐全，会后循环使用较少。 建议： 1. 建议定制采购一批电子座位签，在27楼...</span>
          </dd>
        </dl>
        <template v-if="isShowChildren">
          <task-template v-for="(child,index) in children" :key="index"></task-template>
        </template>
      </div>
    </div>

    <div class="borderbox-main-item open-details">
      <dl class="has-btn">
        <dt>最新进展：</dt>
        <dd>
          <span>01/10 21:03 已完成，并分别与建议提出人、战略规划部及许处沟通，已确认，申请关闭。(吴挺5566）</span>
          <font @click="isMoreProgress=!isMoreProgress" class="close-details-btn">
            {{isMoreProgress?'收起':'更多'}}
            <i class="fa " :class="[isMoreProgress?'fa-angle-double-up':'fa-angle-double-down']"></i>
          </font>
        </dd>
      </dl>
      <div class="borderbox-main-details" v-if="isMoreProgress">
        <div class="borderbox-main-details-scroll">
          <ul>
            <li class="tablelayout active">
              <div class="tablelayout-s">
                <dl>
                  <dt>10/04 21:03</dt>
                  <dd>
                    <div class="btn btn-default">进展</div>
                  </dd>
                </dl>
              </div>
              <div class="tablelayout-s">
                <b></b>
              </div>
              <div class="tablelayout-l">
                <p>电视信号已接入集团应急指挥中心，请阅附件照片。(蒋振钢）</p>
              </div>
            </li>
            <li class="tablelayout">
              <div class="tablelayout-s">
                <dl>
                  <dt>10/04 21:03</dt>
                  <dd>
                    <div class="btn btn-default">进展</div>
                  </dd>
                </dl>
              </div>
              <div class="tablelayout-s">
                <b></b>
              </div>
              <div class="tablelayout-l">
                <p>电视信号已接入集团应急指挥中心，请阅附件照片。(蒋振钢）</p>
              </div>
            </li>
            <li class="tablelayout">
              <div class="tablelayout-s">
                <dl>
                  <dt>10/04 21:03</dt>
                  <dd>
                    <div class="btn btn-default">进展</div>
                  </dd>
                </dl>
              </div>
              <div class="tablelayout-s">
                <b></b>
              </div>
              <div class="tablelayout-l">
                <p>电视信号已接入集团应急指挥中心，请阅附件照片。(蒋振钢）</p>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <!--details-->
    </div>
    <div class="content-borderbox-footer list-opened clearfix">
      <div class="btn btn-primary-outline">同意</div>
      <div class="btn btn-primary-outline">录入进展</div>
      <div class="btn btn-default">批示</div>
      <div @click="isShowChildren=!isShowChildren" class="btn btn-text close-list-btn">
        {{isShowChildren?'收起子任务':'展开子任务'}}
        <i class="fa" :class="[isShowChildren?'fa-angle-double-up':'fa-angle-double-down']"></i>
      </div>

    </div>
  </div>
</template>
<script>

import TaskTemplate from '@/modules/ts/pages/task/tasktemplate.vue'

export default {
  name: "ts-task-template",
  props: {
    taskdata: {
      type: Object,
      default: null
    }
  },
  components: {
    TaskTemplate
  },
  data () {
    return {
      isMoreProgress: false,
      isShowChildren: false,
      children: []
    }
  },
  methods: {
    // 内容类型(1:进展;2:录入意见;3:批示意见...)
    onEdit () {
      this.OpenWindow('/ts/task/detail?id=333222111', true)
    }
  }
}
</script>
