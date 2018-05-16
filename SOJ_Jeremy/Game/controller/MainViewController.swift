//
//  MainViewController.swift
//  Game
//
//  Created by 高菘駿 on 2018/5/16.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var gameOneMaxScoreLabel: UILabel!
    @IBOutlet weak var gameOnePlayTimesLabel: UILabel!
    @IBOutlet weak var gameTwoMaxScoreLabel: UILabel!
    @IBOutlet weak var gameTwoPlayTimesLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let gameOneScore = UserDefaults.standard.integer(forKey: "GameOneScore")
        let gameOneTimes = UserDefaults.standard.integer(forKey: "GameOneTimes")
        let gameTwoScore = UserDefaults.standard.integer(forKey: "GameTwoScore")
        let gameTwoTimes = UserDefaults.standard.integer(forKey: "GameTwoTimes")
        
        print(gameOneTimes)
        print(gameTwoTimes)
        gameOneScore == 0 ? 0 : gameOneScore
        gameOneTimes == 0 ? 0 : gameOneTimes
        
        gameTwoScore == 0 ? 0 : gameOneScore
        gameTwoTimes == 0 ? 0 : gameOneTimes
        
        gameOneMaxScoreLabel.text = "最高分數 \(gameOneScore) 分"
        gameOnePlayTimesLabel.text = "玩了 \(gameOneTimes) 次"
        
        gameTwoMaxScoreLabel.text = "最高分數 \(gameTwoScore) 分"
        gameTwoPlayTimesLabel.text = "玩了 \(gameTwoTimes) 次"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
