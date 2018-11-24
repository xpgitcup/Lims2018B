package cn.edu.cup.userdef

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class UserDefinedFunctionSpec extends Specification implements DomainUnitTest<UserDefinedFunction> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
