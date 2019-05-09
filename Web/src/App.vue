<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>

@import 'assets/css/bootstrap.min.css';
@import 'assets/css/font-awesome.min.css';
@import 'assets/css/site.css';
@import 'assets/css/ui.css';

#app,html,body
{
  padding: 0px !important;
  overflow: hidden;
}
/* 谷歌浏览器滚动条样式美化 */
/*滚动条凹槽的颜色，还可以设置边框属性*/
::-webkit-scrollbar-track-piece
{
  background-color:#f8f8f8;
}
/*滚动条的宽度*/
::-webkit-scrollbar
{
  width:8px;
  height:8px;
}

/*滚动条的设置*/
::-webkit-scrollbar-thumb
{
  background-color:#dddddd;
  background-clip:padding-box;
  min-height:28px;
}

::-webkit-scrollbar-thumb:hover
{
  background-color:#bbb;
}

</style>