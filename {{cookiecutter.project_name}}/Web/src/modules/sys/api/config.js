'use strict'

import ajax from '@/plugin/ajax.js'

const queryConfig = function (
    pageSize,
    pageIndex,
    sortOrder,
    fastSearchFields,
    fastSearchKeyWord
) {
    return ajax.post('/Sys/Config/Query', {
        pageSize,
        pageIndex,
        sortOrder,
        fastSearchFields,
        fastSearchKeyWord
    })
}
const deleteConfig = function (Id) {
    return ajax.post('/Sys/Config/Delete', { Id: Id })
}

const saveConfig = function (model) {
    return ajax.post('/Sys/Config/Save', model)
}
export { queryConfig, deleteConfig, saveConfig }
