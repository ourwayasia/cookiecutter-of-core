'use strict'

import moment from 'moment'

const filters = {
    datetime (val, format) {
        if (!val) return ''
        var f = format || 'YYYY-MM-DD HH:mm:ss'
        return moment(val).format(f)
    }
}

export default filters
