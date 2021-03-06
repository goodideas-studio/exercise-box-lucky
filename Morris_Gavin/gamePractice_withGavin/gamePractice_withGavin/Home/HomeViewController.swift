//
//  HomeViewController.swift
//  gamePractice_withGavin
//
//  Created by Morris on 2018/5/16.
//  Copyright © 2018年 Morris. All rights reserved.
//

import UIKit

class HomeViewController:UIViewController{
    
    var resultFromGuess:String = ""
    var resultFromDice:String = ""
    
    
    
    @IBOutlet weak var guessTimesLabel: UILabel!
    
    @IBOutlet weak var guessScoreLabel: UILabel!
    
    @IBOutlet weak var diceScoreLabel: UILabel!
    @IBOutlet weak var diceTimesLabel: UILabel!
    @IBOutlet weak var diceView: UIView!
    
    @IBOutlet weak var questionView: UIView!
    
    @IBOutlet weak var diceOutlet: UIButton!
    
    @IBOutlet weak var questionOutlet: UIButton!
    
    @IBAction func goDicePressed(_ sender: UIButton) {
        
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func goGuessPressed(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        diceView.layer.cornerRadius = 10
        questionView.layer.cornerRadius = 10
        diceOutlet.layer.cornerRadius = 10
        questionOutlet.layer.cornerRadius = 10


        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeVC willAppear")
        print(UserDefaults.standard.integer(forKey: "highScoreInGuess"))
        var playTimesFromGuess = "\(UserDefaults.standard.integer(forKey: "playTimesInGuess"))"
        
        guessTimesLabel.text = "\(playTimesFromGuess) 次"
        
        var playTimesFromDice = "\(UserDefaults.standard.integer(forKey: "playTimesInDice"))"
        
        diceTimesLabel.text = "\(playTimesFromDice) 次"
        
        guessScoreLabel.text = "\(UserDefaults.standard.integer(forKey: "highScoreInGuess")) / 3題"
        
        diceScoreLabel.text = "\(UserDefaults.standard.integer(forKey: "diceGameHighest"))"
    }
}
