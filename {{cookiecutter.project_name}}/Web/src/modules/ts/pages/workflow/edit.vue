<template>
  <div class="ts-wf-edit">
    <of-scroll :bottom="160">
      <div class="content-box">
        <div class="content-box-title clearfix">
          <div class="box-title-left box-title-text">新建流程</div>
        </div>
        <!--title-->
        <div class="content-box-form content-box-form-edit form-horizontal">
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="control-label col-xs-2">流程名称</label>
                <div class="control-box col-xs-10">
                  <input class="form-control" type="text" placeholder="请输入流程名称" />
                </div>
              </div>
              <!--group-->
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="control-label col-xs-2">流程编码</label>
                <div class="control-box col-xs-10">
                  <input class="form-control" type="text" placeholder="请输入流程编码" />
                </div>
              </div>
              <!--group-->
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="control-label col-xs-2">状态</label>
                <div class="control-box col-xs-10">
                  <div class="clearfix">
                    <div class="form-radio" name="FormRadio-1"><i></i>启用</div>
                    <div class="form-radio selected" name="FormRadio-1"><i></i>停用</div>
                  </div>
                </div>
              </div>
              <!--group-->
            </div>
          </div>
        </div>
        <!--main-->
      </div>
      <!--box-->
      <div class="content-box">
        <div class="content-box-title clearfix">
          <div class="box-title-left box-title-text">设置流程</div>
        </div>
        <!--title-->
        <div class="content-box-process">
          <ul class="clearfix">
            <li>
              <div class="box-process-box">
                <dl>
                  <dt>开始</dt>
                  <dd><i class="fa fa-user"></i>系统管理员</dd>
                  <dd class="box-process-box-edit">
                    <span><i class="fa fa-edit"></i>编辑</span>
                    <span><i class="fa fa-trash"></i>删除</span>
                  </dd>
                </dl>
                <!-- <div class="box-process-tips tips-left">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至前方"><i class="fa fa-plus"></i></div>
                  </div>
                </div> -->
                <div class="box-process-tips tips-right">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至后方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="box-process-box">
                <dl>
                  <dt>录入新任务</dt>
                  <dd><i class="fa fa-user"></i>督办协调员</dd>
                  <dd class="box-process-box-edit">
                    <span><i class="fa fa-edit"></i>编辑</span>
                    <span><i class="fa fa-trash"></i>删除</span>
                  </dd>
                </dl>
                <div class="box-process-tips tips-left">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至前方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
                <div class="box-process-tips tips-right">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至后方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="box-process-box">
                <dl>
                  <dt>审核新任务</dt>
                  <dd><i class="fa fa-user"></i>督办分管领导</dd>
                  <dd class="box-process-box-edit">
                    <span><i class="fa fa-edit"></i>编辑</span>
                    <span><i class="fa fa-trash"></i>删除</span>
                  </dd>
                </dl>
                <div class="box-process-tips tips-left">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至前方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
                <div class="box-process-tips tips-right">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至后方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="box-process-box">
                <dl>
                  <dt>确认新任务</dt>
                  <dd><i class="fa fa-user"></i>主办人</dd>
                  <dd class="box-process-box-edit">
                    <span><i class="fa fa-edit"></i>编辑</span>
                    <span><i class="fa fa-trash"></i>删除</span>
                  </dd>
                </dl>
                <div class="box-process-tips tips-left">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至前方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
                <div class="box-process-tips tips-right">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至后方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="box-process-box">
                <dl>
                  <dt>确认新任务</dt>
                  <dd><i class="fa fa-user"></i>主办人</dd>
                  <dd class="box-process-box-edit">
                    <span><i class="fa fa-edit"></i>编辑</span>
                    <span><i class="fa fa-trash"></i>删除</span>
                  </dd>
                </dl>
                <div class="box-process-tips tips-left">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至前方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
                <div class="box-process-tips tips-right">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至后方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="box-process-box">
                <dl>
                  <dt>确认新任务</dt>
                  <dd><i class="fa fa-user"></i>主办人</dd>
                  <dd class="box-process-box-edit">
                    <span><i class="fa fa-edit"></i>编辑</span>
                    <span><i class="fa fa-trash"></i>删除</span>
                  </dd>
                </dl>
                <div class="box-process-tips tips-left">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至前方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
                <div class="box-process-tips tips-right">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至后方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
                <!--<div class="box-process-tips tips-bottom">
										<div class="box-process-tips-main">
											<div class="btn btn-default" title="编辑节点"><i class="fa fa-edit"></i></div>
											<div class="btn btn-default" title="删除节点"><i class="fa fa-trash"></i></div>
										</div>
									</div>-->
              </div>
            </li>
            <li>
              <div class="box-process-box">
                <dl>
                  <dt>新任务下达</dt>
                  <dd><i class="fa fa-user"></i>系统管理员</dd>
                  <dd class="box-process-box-edit">
                    <span><i class="fa fa-edit"></i>编辑</span>
                    <span><i class="fa fa-trash"></i>删除</span>
                  </dd>
                </dl>
                <div class="box-process-tips tips-left">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至前方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
                <div class="box-process-tips tips-right">
                  <div class="box-process-tips-main">
                    <div class="btn btn-default" title="添加节点至后方"><i class="fa fa-plus"></i></div>
                  </div>
                </div>
                <!--<div class="box-process-tips tips-bottom">
										<div class="box-process-tips-main">
											<div class="btn btn-default" title="编辑节点"><i class="fa fa-edit"></i></div>
											<div class="btn btn-default" title="删除节点"><i class="fa fa-trash"></i></div>
										</div>
									</div>-->
              </div>
            </li>
          </ul>
        </div>
        <!--main-->
      </div>
    </of-scroll>
    <div class="form-footer clearfix">
      <div class="btn btn-warning">确定</div>
      <div class="btn btn-default">取消</div>
    </div>
  </div>
</template>

<script>

import OfScroll from '@/components/controls/of_scroll/of_scroll.vue'

export default {
  name: 'ts-wf-edit',
  components: {
    OfScroll
  },
  data () {
    return {
      wfNodes: [{ Name: '', Handler: '', }]
    }
  },
  mounted () {

  },
  methods: {

  }
}
</script>


<style scoped>
.ts-wf-edit .form-footer {
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  z-index: 0;
  padding-left: 100px;
}
</style>