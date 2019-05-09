'use strict'

const methods = {
  PublicMethod (val) {
    return val
  },
  OpenWindow (path, hidemenu) {
    let url = location.origin + location.pathname+ '#' + path
    if(hidemenu) {
      if(url.indexOf('?') < 0) {
        url += '?'
      } else {
        url += '&'
      }
      url += 'nomenu=1'
    }
    window.open(url)
  }
}

export default methods
