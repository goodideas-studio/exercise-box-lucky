//
//  ViewController.swift
//  sonny
//
//  Created by Sonny on 2018/5/15.
//  Copyright © 2018年 Sonny. All rights reserved.
//

import UIKit

class SuperHeroViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //是否正在遊戲中，避免"GO" btn可一直被點選，造成 timer 越跑越快
    var isplaying = false
    //時間顯示變數
    var seconds:Int = 0
    //分數顯示變數
    var score:Int = 0
    //Random選取 1~4 的數字
    var myRandom = Int(arc4random_uniform(4))
    var timer = Timer()
    //設定 cell 內的 image 是否 ishiden ，初始為 false
    var cellTrueArray = [false,false,false,false]
    //設定 Cell image
    var cellImageArray = ["hulk","deadpool","batman","ironman"]
    //最高分
    var heightScore:Int = 0
    
    let userDefault = UserDefaults.standard
    
    //設定執行次數
    var gameTimes:Int = UserDefaults.standard.integer(forKey:"HSHPlayTimes" )
    var playedTimes:Int = 0
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var myCollectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var resetDisplay: UIButton!
    
    @IBAction func backBtn(_ sender: Any) {
        if score >= heightScore{
            heightScore = score
            userDefault.set(heightScore, forKey: "HSHHeightScore")
            print("HSHHeightScore : \(heightScore)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func startBtn(_ sender: UIButton) {
        
        print("startBtn press")
        //如果遊戲沒有進行，才會執行 runTimer
        if isplaying == false {
            runTimer()
            isplaying = true
        }
        
//        playedTimes += 1
//        userDefault.set(playedTimes, forKey: "HSHPlayTimes")
//        if gameTimes == 0 {
            gameTimes += 1
            userDefault.set(gameTimes, forKey: "HSHPlayTimes")
//
//        } else {
//            gameTimes += 1
//            userDefault.set(gameTimes, forKey: "HSHPlayTimes")
//        }
        print(playedTimes)
        
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        //停止 timer
        timer.invalidate()
        
        if score >= heightScore{
            heightScore = score
            userDefault.set(heightScore, forKey: "HSHHeightScore")
            print("HSHHeightScore : \(heightScore)")
        }
        score = 0
        seconds = 0
        scoreLabel.text = "\(score)"
        timeLabel.text = "\(seconds)"
        isplaying = false
        cellTrueArray = [false,false,false,false]
        print(seconds)
        //        cell.cellImage.isHidden = true
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        resetDisplay.titleLabel?.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        timeLabel.text = "\(seconds)"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! myCollectionViewCell
        cell.cellImage.image = UIImage(named: cellImageArray[indexPath.row])
        cell.cellImage.isHidden = true
        
        
        switch indexPath.row {
        case 0 :
            
            cell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            if  cellTrueArray[indexPath.row] == true {
                cell.cellImage.isHidden = false
            }
        case 1 :
            cell.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            if  cellTrueArray[indexPath.row] == true {
                cell.cellImage.isHidden = false
            }
        case 2 :
            cell.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            if  cellTrueArray[indexPath.row] == true {
                cell.cellImage.isHidden = false
            }
        default :
            cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            if  cellTrueArray[indexPath.row] == true {
                cell.cellImage.isHidden = false
            }
            
        }
        
        return cell
    }
    
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    //    {
    //        var frame  = self.view.frame;
    //        var width = frame.width
    //        width = CGFloat(width/2)
    //        return CGSize(width: width, height: 200)
    //
    //    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if score == 0 {
            resetDisplay.titleLabel?.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }else {
            resetDisplay.titleLabel?.textColor  = #colorLiteral(red: 0.5527273417, green: 0.5872040987, blue: 1, alpha: 1)
        }
        
        //點擊的 cell 如果剛好 對應的 cellTrueArray[indexPath.row] == true，才算成功點擊
        if cellTrueArray[indexPath.row] {
            score += 50
            scoreLabel.text = "\(score)"
            print("Hit Me \(score) times")
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        scoreLabel.text = "\(score)"
        self.myCollectionViewFlowLayout.itemSize.width = (self.view.frame.width) / 2 - 1
        self.myCollectionViewFlowLayout.itemSize.height = (self.view.frame.height) / 2 - 20
        
        if score == 0 {
            resetDisplay.titleLabel?.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            
        }else {
            resetDisplay.titleLabel?.textColor  = #colorLiteral(red: 0.5527273417, green: 0.5872040987, blue: 1, alpha: 1)
            
        }
    }
    
    //設定 timer ，間隔時間為 1秒 ，每秒呼叫 func updateTimer()
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(SuperHeroViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    //呼叫 randomCell ，
    @objc func updateTimer() {
        randomCell()
        //This will decrement(count down)the seconds.
        seconds += 1
        //update time label.
        timeLabel.text = "\(seconds)"
        print(seconds)
        if seconds < 20  {
            myCollectionView.reloadData()
        } else {
            timer.invalidate()
        }
    }
    
    //藉由cellTrueArray 來判定是否顯示 cellImage
    func randomCell() {
        //隨機產生 0,1,2,3, 亂數
        let myRandom = Int(arc4random_uniform(4))
        cellTrueArray = [false,false,false,false]
        cellTrueArray[myRandom] = true
        print(cellTrueArray)
    }
    
    
    
    
    
    
    
}

