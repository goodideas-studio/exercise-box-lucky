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
    
    var directionMaxScore = 0
    var directionGamePlay = 0
    
    @IBAction func test(_ sender: Any) {
        print("OK")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        UserDefaults.standard.set(directionMaxScore, forKey: "directionMaxScore")
//        UserDefaults.standard.set(directionGamePlayLabel, forKey: "directionGamePlay")
        pokerGamePlayLabel.text = "挑戰\(GameRecord.shared.pokerGamePlay)次"
        pokerMaxScoreLabel.text = "最高分數 \(GameRecord.shared.pokerMaxScore)"
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
