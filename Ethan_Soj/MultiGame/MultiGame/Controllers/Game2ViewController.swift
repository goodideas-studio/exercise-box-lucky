//
//  Game2ViewController.swift
//  MultiGame
//
//  Created by EthanLin on 2018/5/16.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit
import GameplayKit

class Game2ViewController: UIViewController {
    
    var game2PlayTimes:Int?
    var game2HighestScore:Int?
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var gameBoardLabel: UILabel!
    
    
    @IBOutlet weak var customer01ImageView: UIImageView!
    @IBOutlet weak var customer01BubbleImageView: UIImageView!
    @IBOutlet weak var customer01DrinkImageView: UIImageView!
    @IBOutlet weak var customer01Clear: UILabel!
    
    @IBOutlet weak var customer02ImageView: UIImageView!
    @IBOutlet weak var customer02BubbleImageView: UIImageView!
    @IBOutlet weak var customer02DrinkImageView: UIImageView!
    @IBOutlet weak var customer02Clear: UILabel!
    
    @IBOutlet weak var customer03ImageView: UIImageView!
    @IBOutlet weak var customer03BubbleImageView: UIImageView!
    @IBOutlet weak var customer03DrinkImageView: UIImageView!
    @IBOutlet weak var customer03Clear: UILabel!
    
    @IBOutlet weak var coverView: UIView!
    
    let imageNames = ["騎士左走", "吸血鬼左走", "骷髏左走", "鬼魂左走"]
    var seatOneIsEmpty = true
    var seatTwoIsEmpty = true
    var seatThreeIsEmpty = true
    
    var timer = Timer()
    var timeCount = 20
    
    var money = 0
    
    
    @IBAction func startButton(_ sender: Any) {
        gameDefault()
        
        coverView.isHidden = true
        
        timerLabel.text = "時間剩下：\(timeCount)秒"
        
        timer = Timer.scheduledTimer(timeInterval: 1 , target: self , selector: #selector( gameTimerCountDown ), userInfo: nil , repeats: true )
        
        createCustomer()
    }
    
    @IBAction func drink01Button(_ sender: Any) {
        print(CustomerOrder.current.order)
        if CustomerOrder.current.order.contains("drink01") {
            let index = CustomerOrder.current.order.index(of: "drink01")
            CustomerOrder.current.order[index!] = ""
            earnMoney(index: index!)
            IsNoCustomer()
        }
    }
    
    @IBAction func drink02Button(_ sender: Any) {
        print(CustomerOrder.current.order)
        if CustomerOrder.current.order.contains("drink02") {
            let index = CustomerOrder.current.order.index(of: "drink02")
            CustomerOrder.current.order[index!] = ""
            earnMoney(index: index!)
            IsNoCustomer()
        }
    }
    
    @IBAction func drink03Button(_ sender: Any) {
        print(CustomerOrder.current.order)
        if CustomerOrder.current.order.contains("drink03") {
            let index = CustomerOrder.current.order.index(of: "drink03")
            CustomerOrder.current.order[index!] = ""
            earnMoney(index: index!)
            IsNoCustomer()
        }
    }
    
    @IBAction func drink04Button(_ sender: Any) {
        print(CustomerOrder.current.order)
        if CustomerOrder.current.order.contains("drink04") {
            let index = CustomerOrder.current.order.index(of: "drink04")
            CustomerOrder.current.order[index!] = ""
            earnMoney(index: index!)
            IsNoCustomer()
        }
    }
    
    func gameDefault() {
        
        money = 0
        moneyLabel.text = "\(money)"
        timerLabel.text = "遊戲尚未開始"
        
        coverView.isHidden = false
        
        seatOneIsEmpty = true
        customer01ImageView.frame.origin = CGPoint(x: view.frame.width, y: 470)
        customer01BubbleImageView.isHidden = true
        customer01DrinkImageView.isHidden = true
        customer01Clear.isHidden = true
        
        seatTwoIsEmpty = true
        customer02ImageView.frame.origin = CGPoint(x: view.frame.width, y: 470)
        customer02BubbleImageView.isHidden = true
        customer02DrinkImageView.isHidden = true
        customer02Clear.isHidden = true
        
        seatThreeIsEmpty = true
        customer03ImageView.frame.origin = CGPoint(x: view.frame.width, y: 470)
        customer03BubbleImageView.isHidden = true
        customer03DrinkImageView.isHidden = true
        customer03Clear.isHidden = true
    }
    
    func createCustomer() {
        
        customer01ImageView.frame.origin = CGPoint(x: view.frame.width, y: 470)
        customer02ImageView.frame.origin = CGPoint(x: view.frame.width, y: 470)
        customer03ImageView.frame.origin = CGPoint(x: view.frame.width, y: 470)
        
        let randomSeatNumber = GKShuffledDistribution(lowestValue: 1, highestValue: 3)
        
        for _ in 1...3 {
            let index = randomSeatNumber.nextInt()
            let randomImageName = imageNames[Int(arc4random_uniform(UInt32(4)))]
            let randomDrinkName = CustomerOrder.current.drinks[Int(arc4random_uniform(UInt32(4)))]
            
            switch index {
            case 1:
                
                if seatOneIsEmpty {
                    seatOneIsEmpty = false
                    customer01ImageView.image = UIImage.animatedImageNamed(randomImageName, duration: 1)
                    CustomerOrder.current.customerImages[0] = randomImageName
                    UIView.animate(withDuration: 3) {
                        self.customer01ImageView.frame.origin.x = 22.5
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        self.customer01ImageView.image = UIImage(named: randomImageName)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            self.customer01BubbleImageView.isHidden = false
                            self.customer01DrinkImageView.image = UIImage(named: randomDrinkName)
                            CustomerOrder.current.order[0] = randomDrinkName
                            self.customer01DrinkImageView.isHidden = false
                        })
                    }
                }
            case 2:
                if seatTwoIsEmpty {
                    seatTwoIsEmpty = false
                    customer02ImageView.image = UIImage.animatedImageNamed(randomImageName, duration: 1)
                    CustomerOrder.current.customerImages[1] = randomImageName
                    UIView.animate(withDuration: 2) {
                        self.customer02ImageView.frame.origin.x = 140
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.customer02ImageView.image = UIImage(named: randomImageName)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            self.customer02BubbleImageView.isHidden = false
                            self.customer02DrinkImageView.image = UIImage(named: randomDrinkName)
                            CustomerOrder.current.order[1] = randomDrinkName
                            self.customer02DrinkImageView.isHidden = false
                        })
                    }
                }
            default:
                if seatThreeIsEmpty {
                    seatThreeIsEmpty = false
                    customer03ImageView.image = UIImage.animatedImageNamed(randomImageName, duration: 1)
                    CustomerOrder.current.customerImages[2] = randomImageName
                    UIView.animate(withDuration: 1) {
                        self.customer03ImageView.frame.origin.x = 257.5
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.customer03ImageView.image = UIImage(named: randomImageName)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            self.customer03BubbleImageView.isHidden = false
                            self.customer03DrinkImageView.image = UIImage(named: randomDrinkName)
                            CustomerOrder.current.order[2] = randomDrinkName
                            self.customer03DrinkImageView.isHidden = false
                        })
                    }
                }
            }
        }
    }
    
    func earnMoney(index: Int) {
        switch index {
        case 0:
            seatOneIsEmpty = true
            customer01BubbleImageView.isHidden = true
            customer01DrinkImageView.isHidden = true
            customer01Clear.isHidden = false
            money += 5
            moneyLabel.text = "\(money)"
            customer01ImageView.image = UIImage.animatedImageNamed(CustomerOrder.current.customerImages[0], duration: 1)
            UIView.animate(withDuration: 1) {
                self.customer01ImageView.frame.origin.x = -90
                self.customer01Clear.isHidden = true
            }
            
        case 1:
            seatTwoIsEmpty = true
            customer02BubbleImageView.isHidden = true
            customer02DrinkImageView.isHidden = true
            customer02Clear.isHidden = false
            money += 5
            moneyLabel.text = "\(money)"
            customer02ImageView.image = UIImage.animatedImageNamed(CustomerOrder.current.customerImages[1], duration: 1)
            UIView.animate(withDuration: 1) {
                self.customer02ImageView.frame.origin.x = -90
                self.customer02Clear.isHidden = true
            }
            
        default:
            seatThreeIsEmpty = true
            customer03BubbleImageView.isHidden = true
            customer03DrinkImageView.isHidden = true
            customer03Clear.isHidden = false
            money += 5
            moneyLabel.text = "\(money)"
            customer03ImageView.image = UIImage.animatedImageNamed(CustomerOrder.current.customerImages[2], duration: 1)
            UIView.animate(withDuration: 1) {
                self.customer03ImageView.frame.origin.x = -90
                self.customer03Clear.isHidden = true
            }
        }
    }
    
    func IsNoCustomer() {
        
        if seatOneIsEmpty && seatTwoIsEmpty && seatThreeIsEmpty {
            createCustomer()
        }
    }
    
    @objc func gameTimerCountDown() {
        if timeCount > 0 {
            timeCount -= 1
            timerLabel.text = "時間剩下：\(timeCount)秒"
        } else {
            timer.invalidate()
            timeCount = 20
            coverView.isHidden = false
            gameBoardLabel.isHidden = false
            
            //在這邊負責存入遊玩次數及最高分
            self.game2PlayTimes! = self.game2PlayTimes! + 1
            UserDefaults.standard.set(self.game2PlayTimes, forKey: "game2PlayTimes")
            
            //
            if self.money >= self.game2HighestScore!{
                UserDefaults.standard.set(self.money, forKey: "game2HighestScore")
            }
            
            if money < 120 {
                gameBoardLabel.text = "不到120分,請再接再厲"
            } else {
                gameBoardLabel.text = "哇！超過120分,繼續突破記錄吧！"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameDefault()
        gameBoardLabel.isHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.game2PlayTimes = UserDefaults.standard.integer(forKey: "game2PlayTimes")
        self.game2HighestScore = UserDefaults.standard.integer(forKey: "game2HighestScore")
        
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
