//
//  MasterViewController.swift
//  Ells_game
//
//  Created by 唐嘉伶 on 2018/5/16.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

  @IBOutlet weak var game1Btn: UIButton!
  @IBOutlet weak var game2Btn: UIButton!
  let userdefaults = UserDefaults.standard
  
  
  @IBOutlet weak var game1PlayedTimesLabel: UILabel!
  @IBOutlet weak var game1HistoryHighScore: UILabel!
  
  @IBOutlet weak var game2PlayedTimes: UILabel!
  @IBOutlet weak var game2historyHighScore: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    var gameOnePlayedTimes = userdefaults.integer(forKey: "EllsGamePlayedTimes")
    var gameOneHighScore = userdefaults.integer(forKey: "game1HighScore")
    var game2HistoryHigh = userdefaults.integer(forKey: "game1Score")
    var gameTwoPlayedTimes = userdefaults.integer(forKey: "game1PlayedTimes")
    game1PlayedTimesLabel.text = "\(gameOnePlayedTimes)"
    game1HistoryHighScore.text = "highest score is: \(gameOneHighScore)"
    game2PlayedTimes.text = "\(gameTwoPlayedTimes)"
    game2historyHighScore.text = "highest score is: \(game2HistoryHigh)"
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    var gameOnePlayedTimes = userdefaults.integer(forKey: "EllsGamePlayedTimes")
    var gameOneHighScore = userdefaults.integer(forKey: "game1HighScore")
    var game2HistoryHigh = userdefaults.integer(forKey: "game1Score")
    var gameTwoPlayedTimes = userdefaults.integer(forKey: "game1PlayedTimes")
    game1PlayedTimesLabel.text = "\(gameOnePlayedTimes)"
    game1HistoryHighScore.text = "highest score is: \(gameOneHighScore)"
    game2PlayedTimes.text = "\(gameTwoPlayedTimes)"
    game2historyHighScore.text = "highest score is: \(game2HistoryHigh)"
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
    


}
