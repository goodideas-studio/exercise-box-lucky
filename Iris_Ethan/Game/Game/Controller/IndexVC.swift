//
//  IndexVC.swift
//  Game
//
//  Created by Peichun Tsai on 2018/5/16.
//  Copyright © 2018年 Peichun Tsai. All rights reserved.
//

import UIKit

class IndexVC: UIViewController {

   
    @IBOutlet weak var pokerGamePlayLabel: UILabel!
    @IBOutlet weak var pokerMaxScoreLabel: UILabel!
    @IBOutlet weak var directionGamePlayLabel: UILabel!
    @IBOutlet weak var directionMaxScoreLabel: UILabel!
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        pokerGamePlayLabel.text = "挑戰\(UserDefaults.standard.integer(forKey: "pokerGamePlay"))次"
        pokerMaxScoreLabel.text = "最高分數 \(UserDefaults.standard.integer(forKey: "pokerGameMaxScore"))"
        directionGamePlayLabel.text = "挑戰\(UserDefaults.standard.integer(forKey: "directionGamePlay"))次"
        directionMaxScoreLabel.text = "最高分數 \(UserDefaults.standard.integer(forKey: "directionMaxScore"))"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    

    

}
