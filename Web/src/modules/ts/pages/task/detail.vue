<template>
  <div class="ts-task-detail">
    <of-scroll ref="scroll" :top="76" :bottom="72">
      <div class="content-box">
        <div class="content-box-title clearfix">
          <div class="box-title-left box-title-text">任务信息</div>
          <div class="box-title-right fa close-box-btn"></div>
          <div class="box-title-right box-title-btn">
            <i class="fa fa-heart-o"></i>添加关注
          </div>
        </div>
        <!--title-->
        <div class="content-box-form form-horizontal">
          <div class="box-form-part">
            <div class="form-group">
              <label class="control-label col-xs-2">任务标题</label>
              <div class="control-box col-xs-10">
                <p class="form-control-static">中广核集团优化CNP主页模块设计</p>
              </div>
            </div>
            <!--group-->
            <div class="form-group">
              <label class="control-label col-xs-2">任务内容</label>
              <div class="control-box col-xs-10">
                <p class="form-control-static">对集团CNP主页的页面风格进行个性化设计，做到大气、简洁、清晰、直观，让用户有很好的体验，同时让系统更加稳定可靠，24小时无故障运行。</p>
              </div>
            </div>
            <!--group-->
            <div class="form-group">
              <label class="control-label col-xs-2">任务类型</label>
              <div class="control-box col-xs-10">
                <p class="form-control-static">总经理月度例会</p>
              </div>
            </div>
            <!--group-->
            <div class="form-group">
              <label class="control-label col-xs-2">任务期限</label>
              <div class="control-box col-xs-10">
                <p class="form-control-static">2018/12/22 - 2019/03/01</p>
              </div>
            </div>
            <!--group-->
          </div>
          <!--part-->
          <div class="box-form-part">
            <div class="row">
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="control-label col-xs-4">任务布置人</label>
                  <div class="control-box col-xs-8">
                    <p class="form-control-static">王大力（集团副总）</p>
                  </div>
                </div>
                <!--group-->
              </div>
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="control-label col-xs-4">任务审批人</label>
                  <div class="control-box col-xs-8">
                    <p class="form-control-static">刘志杰（秘书）</p>
                  </div>
                </div>
                <!--group-->
              </div>
            </div>
            <div class="row">
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="control-label col-xs-4">主办人</label>
                  <div class="control-box col-xs-8">
                    <p class="form-control-static">李旭东（信息中心）</p>
                  </div>
                </div>
                <!--group-->
              </div>
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="control-label col-xs-4">主办分管领导</label>
                  <div class="control-box col-xs-8">
                    <p class="form-control-static">刘永超（信息中心）</p>
                  </div>
                </div>
                <!--group-->
              </div>
            </div>
            <div class="row">
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="control-label col-xs-4">督办协调员</label>
                  <div class="control-box col-xs-8">
                    <p class="form-control-static">王浩东（办公厅）</p>
                  </div>
                </div>
                <!--group-->
              </div>
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="control-label col-xs-4">王浩东（办公厅）</label>
                  <div class="control-box col-xs-8">
                    <p class="form-control-static">刘毅鸣（办公厅）</p>
                  </div>
                </div>
                <!--group-->
              </div>
            </div>
            <div class="row">
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="control-label col-xs-4">主办人</label>
                  <div class="control-box col-xs-8">
                    <p class="form-control-static">李国辉（运营部）</p>
                  </div>
                </div>
                <!--group-->
              </div>
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="control-label col-xs-4">主办分管领导</label>
                  <div class="control-box col-xs-8">
                    <p class="form-control-static">刘永超（信息中心）</p>
                  </div>
                </div>
                <!--group-->
              </div>
            </div>
            <div class="row">
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="control-label col-xs-4">任务来源</label>
                  <div class="control-box col-xs-8">
                    <p class="form-control-static">来自于总经理部月度例会</p>
                  </div>
                </div>
                <!--group-->
              </div>
              <div class="col-xs-6">
                <div class="form-group">
                  <label class="control-label col-xs-4">任务编号</label>
                  <div class="control-box col-xs-8">
                    <p class="form-control-static">201812300003</p>
                  </div>
                </div>
                <!--group-->
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-xs-2">任务期限</label>
              <div class="control-box col-xs-10">
                <ul class="form-attachment-list">
                  <li>
                    <i class="icon-office icon-office-doc"></i>
                    <span>21KB</span>
                    <a>关于CNP主页整体风格的建议1/11.doc</a>
                  </li>
                  <li>
                    <i class="icon-office icon-office-ppt"></i>
                    <span>21KB</span>
                    <a>关于CNP主页整体风格的建议1/11.ppt</a>
                  </li>
                </ul>
              </div>
            </div>
            <!--group-->
          </div>
          <!--part-->
        </div>
        <!--main-->
      </div>
      <!--box-->
      <div class="content-box">
        <div class="content-box-title clearfix">
          <div class="box-title-left box-title-text">子任务</div>
          <div class="box-title-right fa close-box-btn"></div>
        </div>
        <!--title-->
        <div class="content-box-form">
          <div class="box-form-tree">
            <ul>
              <li>
                <dl>
                  <dt>中广核集团CNP主页优化</dt>
                  <dd>
                    <span>刘晓霞（信息中心）</span>
                    <p>最新进展：12/12 21:03 完成整体页面设计，准备进入开发阶段。(李栋梁）</p>
                  </dd>
                  <dd class="box-form-tree-btn">
                    <a><i class="fa fa-heart-o"></i>添加关注</a>
                  </dd>
                </dl>
                <ul>
                  <li>
                    <dl>
                      <dt>中广核集团CNP主页优化</dt>
                      <dd>
                        <span>刘晓霞（信息中心）</span>
                        <p>最新进展：12/12 21:03 完成整体页面设计，准备进入开发阶段。(李栋梁）</p>
                      </dd>
                      <dd class="box-form-tree-btn">
                        <a><i class="fa fa-heart-o"></i>添加关注</a>
                      </dd>
                    </dl>
                  </li>
                  <li>
                    <dl>
                      <dt>中广核集团CNP主页优化</dt>
                      <dd>
                        <span>刘晓霞（信息中心）</span>
                        <p>最新进展：12/12 21:03 完成整体页面设计，准备进入开发阶段。(李栋梁）</p>
                      </dd>
                      <dd class="box-form-tree-btn">
                        <a><i class="fa fa-heart-o"></i>添加关注</a>
                      </dd>
                    </dl>
                  </li>
                </ul>
              </li>
              <li>
                <dl>
                  <dt>中广核集团CNP主页优化</dt>
                  <dd>
                    <span>刘晓霞（信息中心）</span>
                    <p>最新进展：12/12 21:03 完成整体页面设计，准备进入开发阶段。(李栋梁）</p>
                  </dd>
                  <dd class="box-form-tree-btn">
                    <a><i class="fa fa-heart-o"></i>添加关注</a>
                  </dd>
                </dl>
              </li>
            </ul>
          </div>
        </div>
        <!--main-->
      </div>
      <!--box-->
      <div class="content-box">
        <div class="content-box-title clearfix">
          <div class="box-title-left box-title-text">任务处理信息</div>
          <div class="box-title-right fa close-box-btn"></div>
          <div class="box-title-right">
            <div class="form-checkbox checked"><i class="fa fa-check"></i>仅看进展</div>
          </div>
          <div class="box-title-right">
            <div class="borderbox-info-progress">
              <div class="bar">
                <span style="width: 42%;"></span>
              </div>
              <div class="num">42%</div>
            </div>
          </div>
        </div>
        <!--title-->
        <div class="content-box-progress">
          <div class="borderbox-main-details">
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
        </div>
        <!--main-->
      </div>
      <!--box-->
    </of-scroll>
    <!--content-->
    <div class="form-footer clearfix">
      <div class="btn btn-primary-outline">移交</div>
      <div class="btn btn-primary-outline">取消申请</div>
      <div class="btn btn-primary-outline">修改任务</div>
      <div class="btn btn-primary-outline">录入意见</div>
      <div class="btn btn-primary-outline">设置预警</div>
      <div class="btn btn-primary-outline">催办</div>
      <div class="btn btn-primary-outline">抄送</div>
    </div>
    <!--footer-->
    <div class="form-footer-dialog">
      <div class="footer-control">
        <div class="tablelayout">
          <div class="tablelayout-s">
            <div class="footer-control-label">催办</div>
          </div>
          <div class="tablelayout-l">
            <input class="form-control" type="text" placeholder="请填写催办内容，50字以内。" />
          </div>
          <div class="tablelayout-s">
            <div class="btn btn-warning">提交</div>
          </div>
          <div class="tablelayout-s">
            <div class="btn btn-default">取消</div>
          </div>
        </div>
      </div>
    </div>
    <!--footer-dialog 由desk添加open-footer-dialog弹出-->
  </div>
</template>

<script>

import OfScroll from '@/components/controls/of_scroll/of_scroll.vue'

export default {
  name: 'ts-task-detail',
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

</style>
