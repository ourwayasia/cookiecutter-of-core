<template>
  <div class="desk" :class="{'open-menu':IsShowSubMenus,'no-menu':!IsShowLeftMenu}">
			<div class="header clearfix">
				<a class="logo" href="/">任务督办系统</a>
				<ul class="ctrl">
          <li v-for="(item,index) in QuickMenus" :key="item.id" :index="index" @click="quickMenuItemClick(item)">
            <a><i :class="item.IconCss"></i>{{item.MenuName}}</a>
          </li>
					<!-- <li>
						<a><i class="fa fa-question-circle"></i>系统指南</a>
					</li>
					<li>
						<a><i class="fa fa-chevron-circle-right"></i>进入旧版</a>
					</li> -->
					<li class="hoverdown">
						<a>{{CurrentLocale}}<i class="fa fa-angle-down"></i></a>
						<div class="hoverdown-menu">
							<div class="hoverdown-menu-content">
                <a @click="toggleLocales(item.k)" v-for="(item,index) in Locales" :key="index" :index="index">{{item.v}}</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!--header-->
			<div class="menu" v-if="IsShowLeftMenu">
				<ul>
          <template v-for="(item, index) in Menus" :index="index" >
            <li @click="menuItemClick(item)" :key="item.id" :class="{active:CurrentActiveMainMenuID==item.id}">
              <i :class="item.icon"></i>
              <span>{{item.text}}</span>
              <font v-if="TipsQty.length>index&&TipsQty[index]!='0'">{{TipsQty[index]}}</font>
            </li>
          </template>
				</ul>
				<div class="menu-sub">
          <template v-for="(item,index) in SubMenus" :index="index">
            <dl @click.stop="subMenuItemClick(item)" :key="item.id" :class="{'menu-sub-list':item.children&&item.children.length>0,'active':item.id===CurrentSpreadMenuID}">
              <dt><a :class="{'active':CurrentActiveSubMenuID===item.id}">{{item.text}}</a></dt>
              <dd v-if="item.children&&item.children.length>0">
                <a @click.stop="subMenuItemClick(item2)" :class="{'active':CurrentActiveSubMenuID===item2.id}" v-for="(item2,index2) in item.children" :key="item2.id" :index="index2">{{item2.text}}</a>
              </dd>
            </dl>
          </template>
				</div>
				<div class="menu-user" @click="toLogin">
					<img src="../assets/images/header-demo.jpg">
				</div>
			</div>
			<!--menu-->
			<div class="content">
        <router-view></router-view>
      </div>
			<!--content-->
		</div>
</template>

<script>

export default {
  name: 'of-layout',
  data () {
    return {
      Locales:[{k:'zh-cn',v:'中文'},{k:'en',v:'English'}],
      CurrentBreadcrumb: [],
      EditPassWordVisible: false,
      CurrentActiveMainMenuID:'',   //当前活动一级菜单Id
      CurrentSpreadMenuID: '',      //当前展开的MenuId
      CurrentActiveSubMenuID: '',     //当前活动的子菜单Id
      TipsQty:[]
    }
  },
  computed: {
    IsShowLeftMenu () {
      let nomenu = this.$route.query.nomenu
      if (nomenu) {
        return false
      }
      return true
    },
    Menus () {
      let permissions = this.$store.getters.GetCurrentPermissions
      let menuList = this.$store.getters.GetCurrentMenus.filter(item => {
        let node = permissions.find(obj => {
          return obj.ModuleKey === item.ModuleKey && obj.Operation === 'read'
        })
        return (!item.ModuleKey) || (item.ModuleKey && (!node || (node && node.HasAccess)))
      })
      let menuTree = this._menuListToTree(menuList)
      return menuTree
    },
    QuickMenus(){
      let permissions = this.$store.getters.GetCurrentPermissions
      let menuList = this.$store.getters.GetCurrentMenus.filter(item => {
        let node = permissions.find(obj => {
          return obj.ModuleKey === item.ModuleKey && obj.Operation === 'read'
        })
        return ((!item.ModuleKey) || (item.ModuleKey && (!node || (node && node.HasAccess)))) && item.IsQuickMenu
      })
      return menuList
    },
    SubMenus(){
      let menuItem = this.Menus.find(item=>item.id===this.CurrentActiveMainMenuID)
      return menuItem && menuItem.children ? menuItem.children : []
    },
    IsShowSubMenus(){
      return this.SubMenus && this.SubMenus.length ? true : false
    },
    CurrentLocale (){
      let o = this.Locales.find(item=>item.k===this.$i18n.locale)
      return o ? o.v : '中文'
    },
    IsLoading () {
      return this.$store.getters.GetIsLoadingGetIsLoading
    },
    CurrentUserName () {
      let currentUserInfo = this.$store.getters.GetCurrentUserInfo
      let r = '点击登录'
      if (currentUserInfo) {
        r = currentUserInfo.Nickname
      }
      return r
    },
    LeftAsideWidth () {
      return this.IsCollapse ? '65px' : '240px'
    },
    HeaderMenuLeft () {
      return this.IsCollapse ? '111px' : '286px'
    },
    HeaderMenuWidth () {
      let clientWidth = document.documentElement.clientWidth
      let leftwidth = this.IsCollapse ? 111 : 286
      let menuwidth = clientWidth - leftwidth - 200
      return menuwidth + 'px'
    },
    LeftMenuHeight () {
      let clientHeight = document.documentElement.clientHeight
      return (clientHeight - 60 - 124) + 'px'
    },
    ContentHeight () {
      let clientHeight = document.documentElement.clientHeight
      return (clientHeight - 60) + 'px'
    },
    SystemTitle () {
      let title = 'OF Framework'
      let currentConfig = this.$store.getters.GetCurrentConfig
      if (currentConfig && currentConfig.SystemTitle) {
        title = currentConfig.SystemTitle
      }
      return title
    }
  },
  mounted () {
    this.Menus.forEach(() =>{
      this.TipsQty.push('0')
    })
    this.$bus.$on("setMenuItemTip", (index, val) => {
      if(val > 99) {
        val = '99+'
      }
      this.$set(this.TipsQty,index,val)
    })
  },
  methods: {
    _menuListToTree (data) {
      function tree (id) {
        let arr = []
        data.filter(item => {
          if (id) {
            return item.ParentId === id && (!item.IsQuickMenu)
          } else {
            return (item.ParentId === '' || item.ParentId === null) && (!item.IsQuickMenu)
          }
        }).forEach(item => {
          arr.push({
            id: item.Id,
            text: item.MenuName,
            icon: item.IconCss,
            url: item.MenuUrl,
            key: item.ModuleKey,
            children: tree(item.Id)
          })
        })
        return arr
      }
      return tree(null)
    },
    toggleLocales(val){
      this.$i18n.locale = val
    },
    quickMenuItemClick(item){
      if(item){
        this.goto({
          url : item.MenuUrl
        })
      }
    },
    menuItemClick(item){
      if(item){
        if(item.children && item.children.length > 0) { //有子菜单
          if(this.CurrentActiveMainMenuID === item.id) {
            this.CurrentActiveMainMenuID = ''
          } else {
            this.CurrentActiveMainMenuID = item.id
          }
        } else {
          this.CurrentActiveMainMenuID = item.id
          this.CurrentSpreadMenuID = ''
          this.CurrentActiveSubMenuID = ''
          this.goto(item)
        }
      }
    },
    subMenuItemClick(item) {
      if(item){
        window.console.log(item)
        if(item.children && item.children.length > 0) {
          if(this.CurrentSpreadMenuID === item.id) {
            this.CurrentSpreadMenuID = ''
          } else {
            this.CurrentSpreadMenuID = item.id
          }
        } else {
          this.CurrentActiveSubMenuID = item.id
          this.goto(item)
        }
      }
    },
    toggleShowSubMenu (item) {
      if (item.children && item.children.length > 0) {
        if (this.CurrentSpreadMenuID !== item.id) {
          this.CurrentSpreadMenuID = item.id
        } else if (this.CurrentSpreadMenuID) {
          this.CurrentSpreadMenuID = ''
        }
      } else {
        this.goto(item)
      }
    },
    goto (item) {
      if (item.url && item.url !== '#') {
        if (item.url.substr(0, 4) === 'http') {
          window.open(item.url)
        } else {
          this.$router.push(item.url)
        }
        this.CurrentActiveSubMenuID = item.id
      }
    },
    toLogin(){
      this.$router.push('/login')
    },
    logoclick () {
      this.$router.push('/')
    },
    toggle () {
      this.IsCollapse = !this.IsCollapse
    },
    handleSelect (id) {
      this.CurrentTopMenuID = id
    },
    onRedirect (item) {
      this.CurrentBreadcrumb = []
      this.CurrentBreadcrumb.push(item)
    },
    handleCommand (command) {
      if (command === 'logout') {
        this._logout()
      }
      if (command === 'pwd') {
        this._updatePassword()
      }
    },
    _logout () {
      this.$store.commit('UPDATE_USERTOKEN', '')
      this.$http.post('/Sys/Account/Logout').then(() => {
        this.$router.push('/login')
      })
    },
    _updatePassword () {
      this.EditPassWordVisible = true
      this.formTitle = '修改密码'
      this.formData = this.$store.getters.GetCurrentUserInfo
    }
  }
}
</script>

<style scoped>

</style>
