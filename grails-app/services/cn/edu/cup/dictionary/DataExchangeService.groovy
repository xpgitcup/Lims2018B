package cn.edu.cup.dictionary

import grails.gorm.transactions.Transactional

@Transactional
class DataExchangeService {

    def getValueMap(DataItem dataItem) {
        def data = [:]
        data.name = dataItem.dataKey.dataTag
        data.value = dataItem.dataValue
        if (dataItem.subDataItems) {
            def value = []
            dataItem.subDataItems.each { e->
                def vm = getValueMap(e)
                value.add(vm)
            }
            data.values = value
        }
        return data
    }

}
