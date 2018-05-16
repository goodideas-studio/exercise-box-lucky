//
//  Game1ViewController.swift
//  MultiGame
//
//  Created by EthanLin on 2018/5/16.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

class Game1ViewController: UIViewController {
    
    //紀錄最高分與遊戲次數
    var game1HighestScore:Int?
    var game1PlayTimes:Int?
    
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
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Up"
        rule(direction: self.direction, gestureDirection: self.gestureDirection)
    }
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Down"
        rule(direction: self.direction, gestureDirection: self.gestureDirection)
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Left"
        rule(direction: self.direction, gestureDirection: self.gestureDirection)
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Right"
        rule(direction: self.direction, gestureDirection: self.gestureDirection)
    }
    
    
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
    
    //倒數計時方法
    @objc func countDown(){
        if self.counter > 0{
            counter -= 1
        }else{
            if self.alertPresentedForCountDown == false{
                let alert = UIAlertController(title: "時間到", message: "遊戲結束，您的得分為\(self.totalScore)", preferredStyle: .alert)
                let action = UIAlertAction(title: "確定", style: .default) { (action) in
                    
                    //按下確定後把遊玩次數+1並存在UserDefault
                    self.game1PlayTimes! = self.game1PlayTimes! + 1
                    UserDefaults.standard.set(self.game1PlayTimes, forKey: "game1PlayTimes")
                    //按下確定後把分數存到UserDefault(前提是這次的最高分比前一次高才存)
                    if self.totalScore >= self.game1HighestScore!{
                        UserDefaults.standard.set(self.totalScore, forKey: "game1HighestScore")
                    }
                    
                    
                    self.isGamePlaying = false
                    self.timer?.invalidate()
                    self.counter = 20
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                //Present完以後把alertPreseted改成已經出現
                self.alertPresentedForCountDown = true
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //把UserDefault得到的值存進去原本的game1PlayTimes
        self.game1PlayTimes = UserDefaults.standard.integer(forKey: "game1PlayTimes")
        //把UserDefaults存過的最高分存回最高分
        self.game1HighestScore = UserDefaults.standard.integer(forKey: "game1HighestScore")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
