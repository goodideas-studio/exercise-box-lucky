//
//  ResultViewController.swift
//  gamePractice
//
//  Created by Morris on 2018/5/15.
//  Copyright © 2018年 Morris. All rights reserved.
//
import UIKit

class ResultViewController: UIViewController {
//    var scoreForResult:Int?
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var restartOutlet: UIButton!
    
    @IBAction func restartButton(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? Quiz1ViewController{
//            vc.scoreInQuiz1 = 0
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "答對了 \(Player.correctCount) 題！"
        print(UserDefaults.standard.integer(forKey: UserDefaultKey.guessHighScore))
        if Player.correctCount > UserDefaults.standard.integer(forKey: UserDefaultKey.guessHighScore){
            
            
            UserDefaults.standard.set(Player.correctCount, forKey: UserDefaultKey.guessHighScore)
        }
        
        restartOutlet.layer.cornerRadius = restartOutlet.frame.height / 2
        
    }
    
}
