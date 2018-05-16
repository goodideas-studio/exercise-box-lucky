import Foundation

class CustomerOrder {
    static let current = CustomerOrder()
    
    private init() { }
    
    var drinks = ["drink01", "drink02", "drink03", "drink04"]
    var order = ["", "", ""]
    var customerImages = ["", "", ""]
    
}
