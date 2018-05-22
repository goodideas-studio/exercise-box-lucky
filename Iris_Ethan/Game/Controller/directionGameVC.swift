//
//  directionGameVC.swift
//  Game
//
//  Created by Peichun Tsai on 2018/5/16.
//  Copyright © 2018年 Peichun Tsai. All rights reserved.
//

import UIKit

enum GestureDirection:String{
    case Up
    case Down
    case Left
    case Right
}

enum ImageDirection:String{
    case blueUp
    case blueDown
    case blueLeft
    case blueRight
    case redUp
    case redDown
    case redLeft
    case redRight
}

class directionGameVC: UIViewController {
    
    var userDefault = UserDefaults.standard
    var gamePlay = 0
    var maxScore = 0
    var storedGamePlay = 0
    
    //記得圖片一開始位置
    var imageOriginCoordinate:CGFloat?
    //遊戲進行與否
    var isGamePlaying:Bool = false
    //處理時間到了以後alert重複Present的問題
    var alertPresentedForCountDown:Bool = false
    
    //倒數計時
    var timer:Timer?
    var counter = 20{
        didSet{
            self.timeLabel.text = "時間:\(counter)秒"
        }
    }
    

    @IBOutlet weak var imageView: UIImageView!
    //時間
    @IBOutlet weak var timeLabel: UILabel!
    //分數表
    @IBOutlet weak var scoreLabel: UILabel!
    

    
    //裡面的圖案種類
    let arrowArray = ["blueUp","blueDown","blueRight","blueLeft","redUp","redDown","redLeft","redRight"]
    //手勢的方向
    var gestureDirection:String = ""
    //圖片的方向
    var direction:String = ""
    var totalScore:Int = 0{
        didSet{
            self.scoreLabel.text = "分數:\(totalScore)分"
        }
    }
    
    // MARK: - Game rule
    func rule(direction:String,gestureDirection:String){
        if self.isGamePlaying{
            //記得原本的位置
            self.imageOriginCoordinate = self.imageView.frame.origin.x
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.imageView.frame.origin.x = self.imageView.frame.origin.x - 50
                self.imageView.alpha = CGFloat(0.0)
            }, completion: nil)
            if direction.contains("blue"){
                if direction == "blueUp" && gestureDirection == "Up"{
                    self.totalScore += 20
                }else if direction == "blueDown" && gestureDirection == "Down"{
                    self.totalScore += 20
                }else if direction == "blueLeft" && gestureDirection == "Left"{
                    self.totalScore += 20
                }else if direction == "blueRight" && gestureDirection == "Right"{
                    self.totalScore += 20
                }
            }else{
                if direction == "redUp" && gestureDirection == "Down"{
                    self.totalScore += 20
                }else if direction == "redDown" && gestureDirection == "Up"{
                    self.totalScore += 20
                }else if direction == "redLeft" && gestureDirection == "Right"{
                    self.totalScore += 20
                }else if direction == "redRight" && gestureDirection == "Left"{
                    self.totalScore += 20
                }
            }
            self.direction = self.arrowArray[Int(arc4random_uniform(UInt32(self.arrowArray.count)))]
            //把原本的位置存回去
            self.imageView.frame.origin.x = self.imageOriginCoordinate! + 50
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.imageView.frame.origin.x = self.imageView.frame.origin.x - 50
                self.imageView.alpha = CGFloat(1.0)
            }, completion: nil)
            self.imageView.image = UIImage(named: self.direction)
        }
    }
    
    
    // MARK: - Reset game
    @IBAction func reset(_ sender: UIButton) {
        let alert = UIAlertController(title: "遊戲將重新開始", message: "按下確定後重新開始", preferredStyle: .alert)
        let action = UIAlertAction(title: "確定", style: .default) { (action) in
            self.isGamePlaying = true
            self.totalScore = 0
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
            //按下確定後要再把alertPresetForCountDown改成false
            self.alertPresentedForCountDown = false
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Gesture recognize
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Right"
        rule(direction: self.direction, gestureDirection: self.gestureDirection)
    }
    
 
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Up"
        rule(direction: self.direction, gestureDirection: self.gestureDirection)
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Left"
        rule(direction: self.direction, gestureDirection: self.gestureDirection)
    }
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Down"
        rule(direction: self.direction, gestureDirection: self.gestureDirection)
    }
    
    

    //MARK: - Timer & Game Record
    //倒數計時方法
    @objc func countDown(){
        if self.counter > 0{
            counter -= 1
        }else{
            if self.alertPresentedForCountDown == false{
                let alert = UIAlertController(title: "時間到", message: "遊戲結束，您的得分為\(self.totalScore)", preferredStyle: .alert)
                let action = UIAlertAction(title: "確定", style: .default) { (action) in
                    self.isGamePlaying = false
                    self.timer?.invalidate()
                    self.counter = 20
                    
                    
                    
                    if self.gamePlay <= self.userDefault.integer(forKey: "directionGamePlay") {
                        self.gamePlay += 1
                        self.storedGamePlay = self.userDefault.integer(forKey: "directionGamePlay") + self.gamePlay
                        self.userDefault.set(self.storedGamePlay, forKey: "directionGamePlay")
                    }
                 

                    
                    if self.totalScore >  self.userDefault.integer(forKey: "directionMaxScore") {
                        self.maxScore = self.totalScore
                        self.userDefault.set(self.maxScore, forKey: "directionMaxScore")
                    
                        
                    }
              
                    print(self.userDefault.integer(forKey: "directionGamePlay"))
                    print(self.userDefault.integer(forKey: "directionMaxScore"))
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                //Present完以後把alertPreseted改成已經出現
                self.alertPresentedForCountDown = true
            }
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userDefault.integer(forKey: "directionGamePlay")
        self.userDefault.integer(forKey: "directionMaxScore")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let alert = UIAlertController(title: "遊戲開始", message: "按下確定後遊戲開始", preferredStyle: .alert)
        let action = UIAlertAction(title: "確定", style: .default) { (action) in
            self.isGamePlaying = true
            self.direction = self.arrowArray[Int(arc4random_uniform(UInt32(self.arrowArray.count)))]
            self.imageView.image = UIImage(named: self.direction)
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
