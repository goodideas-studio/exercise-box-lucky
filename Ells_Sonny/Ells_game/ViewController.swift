//  ViewController.swift
//  Ells_game
//
//  Created by 唐嘉伶 on 2018/5/15.
//  Copyright © 2018 唐嘉伶. All rights reserved.

import UIKit

class ViewController: UIViewController {

  enum direction: Int {
    case up
    case down
    case left
    case right
  }
  
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var numberLabel: UILabel!
  
  @IBOutlet weak var newNumBtn: UIButton!
  @IBOutlet weak var resetBtn: UIButton!
  
  @IBOutlet weak var enterNumTextFd: UITextField!
  @IBOutlet weak var sentResultBtn: UIButton!
  @IBOutlet weak var numContrainerView: UIView!
  
  @IBOutlet weak var numLabelCarrierView: UIView!
  
  
  //玩家得分：答對一題得 10 分
  var score = 0
  //檢查答案是否種正確
  var check = false
  var number = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
  numLabelCarrierView.translatesAutoresizingMaskIntoConstraints = false
    scoreLabel.text = String(0)
    numberLabel.text = ""
    var gameSetting = promptWrongAnswer(title: "Welcome", msg: "If number is black, enter the number from left to right; If number is white, enter the number from right to left", actTitle: "Got it")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  func generateRandomNum() -> String {
    var numA = String(arc4random_uniform(10))
    var numB = String(arc4random_uniform(10))
    var numC = String(arc4random_uniform(10))
    var numD = String(arc4random_uniform(10))
    
    //var returnReversedNum
    number = numA + numB + numC + numD
    return number
  }

  
  func CheckAnswer(answer: String, input text: String) -> Bool {
    print( "answer is \(answer)")
    if answer == text {
      score += 10
      scoreLabel.text = String(score)
      check = true
      var alert = promptWrongAnswer(title: "Rock", msg: "correct", actTitle: " you got it")
      self.present(alert, animated: true, completion: nil)
    } else {
      check = false
      var alert = promptWrongAnswer(title: "Boomer", msg: "sorry", actTitle: "good try")
      self.present(alert, animated: true, completion: nil)
    }
    return check
  }

  
  func CheckReversedAnswer(answer: String, input text: String) -> Bool {
    let reversed = String(answer.reversed())
     print("answer is \(answer)")
    if reversed == text {
      score += 10
      check = true
      scoreLabel.text = String(score)
      var alert = promptWrongAnswer(title: "Rock", msg: "correct", actTitle: " you got it")
      self.present(alert, animated: true, completion: nil)
    } else {
      check = false
      var alert = promptWrongAnswer(title: "Boomer", msg: "sorry", actTitle: "good try")
      self.present(alert, animated: true, completion: nil)
    }
    return check
  }
  
  func generateDirection() {
    var directionNum = Int(arc4random_uniform(2))
    print(directionNum)
    switch direction.RawValue(directionNum)  {
    case 0:
      fromTopation()
    case 1:
      fromBottomAnimation()
    default:
      fromTopation()
    }
  }
  
  @IBAction func askNewNum(_ sender: UIButton) {
    pressToReset()
    generateDirection()
  }
  
  @IBAction func resetGame(_ sender: UIButton) {
    scoreLabel.text = String(0)
    
  }
  
  @IBAction func sentResult(_ sender: UIButton) {
    if check == true {
      CheckAnswer(answer: number, input: enterNumTextFd.text!)
    } else {
      CheckReversedAnswer(answer: number, input: enterNumTextFd.text!)
    }
    enterNumTextFd.text = ""
  }
  
  func fromTopation() {
    number = generateRandomNum()
    check = true
    numberLabel.text = number
    print(number)
    numberLabel.alpha = 1.0
    self.numberLabel.textColor = .black
    self.numLabelCarrierView.frame = CGRect(x: 0, y: 160, width: self.numLabelCarrierView.frame.width, height: self.numLabelCarrierView.frame.height)
    UIView.animate(withDuration: 1.2, delay: 0, options: .curveEaseOut, animations: {
      self.numLabelCarrierView.backgroundColor = .white
      self.numberLabel.alpha = 0
      self.numLabelCarrierView.frame = CGRect(x: self.view.frame.width, y: 160, width: self.numLabelCarrierView.frame.width, height: self.numLabelCarrierView.frame.height)
      self.numLabelCarrierView.layoutIfNeeded()
    }, completion: {_ in
    })
    //scoreLabel.text = String(score)
  }
  
  func fromBottomAnimation() {
    number = generateRandomNum()
    check = false
    numberLabel.text = number
    numberLabel.alpha = 1.0
    self.numLabelCarrierView.frame = CGRect(x: self.view.frame.width, y: 160, width: self.numLabelCarrierView.frame.width, height: self.numLabelCarrierView.frame.height)
    UIView.animate(withDuration: 1.2, delay: 0, options: .curveEaseOut, animations: {
      self.numLabelCarrierView.backgroundColor = .black
      self.numberLabel.textColor = .white
      
      self.numberLabel.alpha = 0
      self.numLabelCarrierView.layoutIfNeeded()
      self.numLabelCarrierView.frame = CGRect(x: 0, y: 160, width: self.numLabelCarrierView.frame.width, height: self.numLabelCarrierView.frame.height)
    }, completion: {_ in
      self.numberLabel.textColor = .white
    })
  }

  func pressToReset() {
    self.numberLabel.text = ""
    self.numberLabel.alpha = 1.0
    enterNumTextFd.text = ""

  }
  
  func promptWrongAnswer(title: String, msg: String, actTitle: String) -> UIAlertController {
    let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    let alertAct = UIAlertAction(title: actTitle, style: .default, handler: nil)
    alert.addAction(alertAct)
    return alert
  }
}

