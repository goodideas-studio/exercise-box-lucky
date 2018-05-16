//
//  Order.swift
//  MultiGame
//
//  Created by EthanLin on 2018/5/16.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import Foundation

class CustomerOrder {
    static let current = CustomerOrder()
    
    private init() { }
    
    var drinks = ["drink01", "drink02", "drink03", "drink04"]
    var order = ["", "", ""]
    var customerImages = ["", "", ""]
    
}
