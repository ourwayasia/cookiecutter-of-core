'use strict'

import ajax from '@/plugin/ajax.js'

const login = function (account, pwd) {
    let url = '/Sys/Account/Login'
    let data = {
        account: account,
        pwd: pwd
    }

    return ajax.post(url, data)
}

export { login }
