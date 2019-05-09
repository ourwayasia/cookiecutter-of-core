'use strict'

import filters from '@/mixins/filters.js'
import methods from '@/mixins/methods.js'
import directives from '@/mixins/directives.js'

const mixins = {
  filters,
  methods,
  directives
}

export default {
  install (Vue) {
    Vue.mixin(mixins)
  }
}
