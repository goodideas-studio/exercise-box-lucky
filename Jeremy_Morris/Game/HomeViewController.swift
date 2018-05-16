//
//  HomeViewController.swift
//  Game
//
//  Created by JeremyXue on 2018/5/16.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var rpsRecordLabel: UILabel!

    @IBOutlet weak var guessRecordLabel: UILabel!
    
    
    @IBAction func enterRPSGame(_ sender: UIButton) {
    }
    
    @IBAction func enterGuessGame(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let playRpsCount = UserDefaults.standard.integer(forKey: UserDefaultKey.playRpsCount) + Player.playRPSCount
        let rpsHighScore = UserDefaults.standard.integer(forKey: UserDefaultKey.rpsHighScore)
        
        let playGuessCount = UserDefaults.standard.integer(forKey: UserDefaultKey.playGuessCount) + Player.playGuessCount
        let guessHighScore = UserDefaults.standard.integer(forKey: UserDefaultKey.guessHighScore)
        
        rpsRecordLabel.text = "遊玩次數：\(playRpsCount),最高分為：\(rpsHighScore) 分"
        guessRecordLabel.text = "遊玩次數：\(playGuessCount),最高分為：\(guessHighScore) 分"
        
        UserDefaults.standard.set(playRpsCount, forKey: UserDefaultKey.playRpsCount)
        UserDefaults.standard.set(playGuessCount, forKey: UserDefaultKey.playGuessCount)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
