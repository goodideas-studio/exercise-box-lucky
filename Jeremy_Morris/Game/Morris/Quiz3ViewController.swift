//
//  Quiz3ViewController.swift
//  gamePractice
//
//  Created by Morris on 2018/5/15.
//  Copyright © 2018年 Morris. All rights reserved.
//
import UIKit

class Quiz3ViewController: UIViewController {
    
//    var scoreFromQuiz2:Int?
//    var scoreInQuiz3:Int?
    
    
    @IBAction func giveUpButton(_ sender: UIBarButtonItem) {
//        scoreInQuiz3 = 0 + scoreFromQuiz2!
        performSegue(withIdentifier: "goResult", sender: self)
//    print("ScoreInQuiz3\(scoreInQuiz3)")
    }
    
    @IBOutlet var animationView: UIView!
    @IBOutlet weak var guessButton: UIButton!
    
    @IBAction func goResultButton(_ sender: UIButton) {
        
//        if let score = scoreFromQuiz2{
//            scoreInQuiz3 = score + 1
//        }
        performSegue(withIdentifier: "goResult", sender: self)
        
//        print("ScoreInQuiz3\(scoreInQuiz3)")
    }
    
    @IBAction func guessAnswerLeftPressed(_ sender: UIButton) {
        Player.correctCount += 1
        guessButton.isUserInteractionEnabled = false
        displayPickerView(true)
    }
//    @IBAction func guessAnswerMidPressed(_ sender: Any) {
//
//
//        displayPickerView(true)
//    }
//    @IBAction func guessAnswerRightPressed(_ sender: UIButton) {
//
//
//
//        displayPickerView(true)
//    }
    
    func displayPickerView(_ show:Bool){
        
        for bottomContraints in view.constraints {
            if bottomContraints.identifier == "bottom" {
                bottomContraints.constant = (show) ? -200 : view.frame.height / 3
                break
            }
        }
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? ResultViewController {
//            vc.scoreForResult = scoreInQuiz3
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(animationView)
        let selectViewHeight = view.frame.height / 5
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalToConstant: selectViewHeight).isActive = true
        animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        let bottomContraints = animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: selectViewHeight)
        bottomContraints.isActive = true
        bottomContraints.identifier = "bottom"
        animationView.layer.cornerRadius = 10
    }
}
