

import Foundation

struct Employee: Values  {
    var name: String
    var age: Int
    var type: UserType
    var salary: Int {
        return (self.age) * self.type.multiplier * 1000
    }
}
