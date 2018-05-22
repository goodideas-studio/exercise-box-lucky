//
//  GameVC.swift
//  Game
//
//  Created by Peichun Tsai on 2018/5/15.
//  Copyright © 2018年 Peichun Tsai. All rights reserved.
//

import UIKit


class GameVC: UIViewController {

    var gestureBool: Bool = false
    var gestureDirection = " "
    var time = 20
    var countdownTimer: Timer!
    var gamePlay = 0
    var storedGamePlay = 0
    var gameMaxScore = 0
    var userDefault = UserDefaults.standard
    
    var cardList = [1,2,3,4,5,6,7,8,9,10,11,12,13]
    var clubCardList = ["c1","c2","c3","c4","c5","c6","c7","c8","c9","c10","c11","c12","c13"]
    var heartCardList =  ["h1","h2","h3","h4","h5","h6","h7","h8","h9","h10","h11","h12","h13"]
    
    var bankerCard: Int!
    var playerCard: Int!

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var tableView: UIImageView!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    @IBOutlet weak var playerCardImage: UIImageView!
    @IBOutlet weak var playerReadyImage: UIImageView!
    @IBOutlet weak var gamblingChipsImage: UIImageView!
    @IBOutlet weak var bankerCardImage: UIImageView!
    @IBOutlet weak var readyPlaceImage: UIImageView!
    @IBOutlet weak var gamerChipsLabel: UILabel!
    @IBOutlet weak var dealBtnOutlet: UIButton!
    
    
    var gamerChips = 100 {
        
        didSet {
            gamerChipsLabel.text = "\(gamerChips)"
            finalScoreLabel.text = "\(gamerChips)"
            if gamerChips <= 100 && gamerChips != 0 {
                gamblingChipsImage.image = UIImage(named: "icons8-chip")
                
            }
                
            else if gamerChips > 100 {
                gamblingChipsImage.image = UIImage(named: "icons8-roulette_chips")
            }
                
            else if gamerChips == 0 {
                gamblingChipsImage.image = UIImage(named: " ")
                endTimer()
                resultView.isHidden = false
                tableView.isUserInteractionEnabled = false
                
                UIView.animate(withDuration: 2, delay: 0, options: .curveLinear , animations: {
                    
                    self.resultView.transform = CGAffineTransform.identity
                    
                }, completion: nil)
            }
        }
    }

    

    
    // MARK: - Gesture Detection
    @IBAction func rightGesture(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Right"
        print("Right")
        
        //gamerChipsLabel.text = "\(gamerChips)"
        judge()
        
        UIView.animate(withDuration: 0.5, animations: {
           print(self.playerReadyImage.frame.origin.x)
//            self.playerReadyImage.frame.origin.x = self.playerReadyImage.frame.origin.x + 50
            self.playerReadyImage.transform = CGAffineTransform(translationX: 1000, y: 0)
            
        }) { (_) in
            self.playerReadyImage.transform = CGAffineTransform.identity
//            self.playerReadyImage.center.x = self.gamerCardPositionCenterX
            self.secondInning()
        }
        
    }
    
    @IBAction func leftGesture(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Left"
        print("Left")
        //gamerChipsLabel.text = "\(gamerChips)"
        judge()
        
        UIView.animate(withDuration: 0.5, animations: {
//            self.playerReadyImage.frame.origin.x = -(self.playerReadyImage.frame.origin.x * 3)
            self.playerReadyImage.transform = CGAffineTransform(translationX: -1000, y: 0)
        }) { (_) in
            // identity 復原到一開始的位置
              self.playerReadyImage.transform = CGAffineTransform.identity
//            self.playerReadyImage.frame.origin.x = 138
            self.secondInning()
        }

    }
    
    
    @IBAction func upGesture(_ sender: Any) {
        self.gestureDirection = "Up"
        
        print("Up")
        judge()
        UIView.animate(withDuration: 0.5, animations: {
//            self.playerReadyImage.frame.origin.y = -self.playerReadyImage.frame.origin.y
            self.playerReadyImage.transform = CGAffineTransform(translationX: 0, y: -1000)
        }) { (_) in
//            self.playerReadyImage.frame.origin.y = 456
            self.playerReadyImage.transform = CGAffineTransform.identity
            self.secondInning()
        }
       
    }
    
    @IBAction func downGesture(_ sender: UISwipeGestureRecognizer) {
        self.gestureDirection = "Down"
        print("Down")
        judge()
        UIView.animate(withDuration: 0.5, animations: {
//            self.playerReadyImage.frame.origin.y = self.playerReadyImage.frame.origin.y * 3
            self.playerReadyImage.transform = CGAffineTransform(translationX: 0, y: 1000)
        }) { (_) in
//            self.playerReadyImage.frame.origin.y = 456
            self.playerReadyImage.transform = CGAffineTransform.identity
            self.secondInning()
        }
    }
    


    // MARK: - 遊戲開始
    @IBAction func dealBtn(_ sender: Any) {
        print("Starting deal cards.")
        dealCard()
        startTimer()
        

    }
    
    func dealCard() {
        
        dealBtnOutlet.isEnabled = false
        
        print(cardList)
        bankerCard = Int(arc4random_uniform(UInt32(cardList.count)))
        print("莊家點數：\(bankerCard + 1)")
        bankerCardImage.image = UIImage(named: "card_front0")
        playerCardImage.image = UIImage(named: "card_front0")
        
        playerCard = Int(arc4random_uniform(UInt32(cardList.count)))
        print("玩家點數：\(playerCard + 1)")
        
        //發牌動畫
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            
            // Here you will get the animation you want
            self.bankerCardImage.center = self.readyPlaceImage.center
            self.bankerCardImage.transform = CGAffineTransform(scaleX: 2, y: 3.5)
            
            self.playerCardImage.center = self.playerReadyImage.center
            self.playerCardImage.transform = CGAffineTransform(scaleX: 2, y: 3.5)

        }, completion: { _ in
            self.bankerCardImage.isHidden = true
            self.playerCardImage.isHidden = true
        })
        

        readyPlaceImage.image = UIImage(named: "c\(self.bankerCard + 1)")
        playerReadyImage.image = UIImage(named: "h\(self.playerCard + 1)")
        
        //翻牌動畫
        //這裡時間要比上面慢，否則在按下發牌機後會和上面同時出現
        UIView.transition(with: self.readyPlaceImage, duration: 2, options: .transitionFlipFromRight, animations: {
            self.bankerCardImage.alpha = 1
        }, completion: nil)
        UIView.transition(with: self.playerReadyImage, duration: 2, options: .transitionFlipFromRight, animations: {
            self.playerCardImage.alpha = 1
        }, completion: nil)

        
      tableView.isUserInteractionEnabled = true
    }
    
    
    func secondInning(){
        bankerCard = Int(arc4random_uniform(UInt32(cardList.count)))
        print("莊家點數：\(bankerCard + 1)")
        readyPlaceImage.image = UIImage(named: "c\(self.bankerCard + 1)")
        
        playerCard =  Int(arc4random_uniform(UInt32(cardList.count)))
        
        print("玩家點數：\(playerCard + 1)")
        playerReadyImage.image = UIImage(named: "h\(self.playerCard + 1)")
        
        
    }
    
    //MARK: - 遊戲結果
    func judge() {

        if playerCard == bankerCard && gestureDirection == "Right" || playerCard == bankerCard && gestureDirection == "Left"{
            gamerChips += 10
        }
        else if playerCard > bankerCard && gestureDirection == "Up" {
            gamerChips += 10
        }
        else if playerCard < bankerCard && gestureDirection == "Down" {
            gamerChips += 10
        } else {
            gamerChips -= 10
        }
    }
    
    @IBAction func resultConfirmBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        if gamePlay <= userDefault.integer(forKey: "pokerGamePlay") {
            gamePlay += 1
            storedGamePlay = userDefault.integer(forKey: "pokerGamePlay") + gamePlay
            userDefault.set(storedGamePlay, forKey: "pokerGamePlay")
        }
        
        if gamerChips > userDefault.integer(forKey: "pokerGameMaxScore") {
            userDefault.set(gamerChips, forKey: "pokerGameMaxScore")
        }
        print(userDefault.integer(forKey: "pokerGamePlay"))
        print(userDefault.integer(forKey: "pokerGameMaxScore"))
    }
    
   
    func callResult() {
        
              //  gamblingChipsImage.image = UIImage(named: "icons8-chip")
                scoreView.isHidden = false
                tableView.isUserInteractionEnabled = false
                UIView.animate(withDuration: 3, delay: 0, options: .curveEaseIn, animations: {
                    
                    self.scoreView.transform = CGAffineTransform.identity
                    
                }, completion: nil)
    }
    
    
    // MARK: - Timer
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        timeLabel.text = "Time: \(time)"
        if time != 0 {
            time -= 1
        } else {
            endTimer()
            callResult()
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
    }
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        

        gamerChipsLabel.text = "\(gamerChips)"
        gamblingChipsImage.image = UIImage(named: "icons8-chip")
        resultView.isHidden = true
        scoreView.isHidden = true
        
        resultView.transform = CGAffineTransform(translationX: 0, y: 1000)
        scoreView.transform = CGAffineTransform(translationX: 0, y: 1000)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
}
