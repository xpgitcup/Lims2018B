package cn.edu.cup.userdef

import cn.edu.cup.dictionary.DataKey

class UserClass {

    String name
    String description
    DataKey baseOn

    static belongsTo = [userClassLibrary: UserClassLibrary]
    static hasMany = [userClassMethod: UserClassMethod]

    static constraints = {
        name()
        description()
        baseOn()
    }

    String toString() {
        return "${name}"
    }

}
