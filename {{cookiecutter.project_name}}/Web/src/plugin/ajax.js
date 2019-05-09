'use strict'

import Vue from 'vue'
import axios from 'axios'
import store from '@/store'
import router from '@/router'
import appconfig from '@/configs/appConfig.js'
import { Message } from 'element-ui'

// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
// 添加请求拦截器
axios.interceptors.request.use(function (config) {
    // 在发送请求之前做些什么
    // 携带UserToken到请求头

    // config.headers.common['Content-Type'] = "application/x-www-form-urlencoded"
    let token = store.getters.GetUserToken
    if (token) {
        config.headers.common['OF-Authorization'] = token
    }
    let requestUrl = appconfig.ApiPrefix + config.url

    if (requestUrl.indexOf('nocache') < 0) {
        if (requestUrl.indexOf('?') < 0) {
            requestUrl += '?'
        } else {
            requestUrl += '&'
        }
        requestUrl += 'nocache=' + new Date().getTime()
    }

    config.url = requestUrl
    return config
}, function (error) {
    // 对请求错误做些什么
    return Promise.reject(error)
})

// 添加响应拦截器
axios.interceptors.response.use(function (response) {
    // 对响应数据做点什么
    if (response.data.Code < 0) {
        Message({
            showClose: true,
            message: response.data.Message,
            type: 'error'
        })
        if (response.data.Code === -1) {
            router.push('/login')
        }

        if (response.data.Code === -2) {
            router.push('/403')
        }
    }
    if (response.data.Code === 4) {
        router.push('/403')
    }
    return response
}, function (error) {
    if(error && error.response && error.response.status === 401) {
        let msg = '授权票据已失效，请重新登录'
        if(error.response && error.response.data && error.response.data.Message) {
            msg = error.response.data.Message
        }
        Message({
            showClose: true,
            message: msg,
            type: 'error'
        })
        router.push('/login')
    }
    // 对响应错误做点什么
    return Promise.reject(error)
})

Vue.prototype.$http = axios

export default axios

