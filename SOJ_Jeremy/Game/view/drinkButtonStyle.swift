//
//  drinkButtonStyle.swift
//  Game
//
//  Created by 高菘駿 on 2018/5/15.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

class drinkButtonStyle: UIButton {
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }

}
