//
//  MenuBalckViewStyle.swift
//  MultiGame
//
//  Created by EthanLin on 2018/5/16.
//  Copyright © 2018 EthanLin. All rights reserved.
//


import UIKit

class MenuBlackViewStyle: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 20.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
    
}
