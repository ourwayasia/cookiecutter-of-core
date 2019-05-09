module.exports = {
  pluginOptions: {
    i18n: {
      locale: 'zh-cn',
      fallbackLocale: 'zh-cn',
      localeDir: 'locales',
      enableInSFC: false
    }
  },

  devServer: {
    proxy: 'http://localhost:8090'
  },

  assetsDir: 'static'
}
