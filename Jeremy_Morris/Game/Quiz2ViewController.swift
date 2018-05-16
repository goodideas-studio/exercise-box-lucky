//
//  Quiz2ViewController.swift.swift
//  gamePractice
//
//  Created by Morris on 2018/5/15.
//  Copyright © 2018年 Morris. All rights reserved.
//
import UIKit

class Quiz2ViewController:UIViewController {
    var scoreFromQuiz1:Int?
    var scoreInQuiz2:Int?
    @IBAction func giveUpButton(_ sender: UIBarButtonItem) {
//        scoreInQuiz2 = 0 + scoreFromQuiz1!
//        print("ScoreInQuiz2\(scoreInQuiz2)")
        performSegue(withIdentifier: "goQuiz3", sender: self)
        //        print("giveUP\(scoreInQuiz2)")
    }
    
    @IBOutlet var animationView: UIView!
    @IBOutlet weak var correctOutlet: UIButton!
    
    @IBAction func correctButtonPressed(_ sender: UIButton) {
        continueOutlet.isEnabled = true
        Player.correctCount += 1
        displayPickerView(false)
    }
    
    @IBOutlet weak var continueOutlet: UIBarButtonItem!
    @IBAction func continuePressed(_ sender: UIBarButtonItem) {
//        if let score = scoreFromQuiz1{
//            scoreInQuiz2 = score + 1
//        }
//        print("ScoreInQuiz2\(scoreInQuiz2)")
        performSegue(withIdentifier: "goQuiz3", sender: self)
    }
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        displayPickerView(true)
        
        
    }
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
//        if let vc = segue.destination as? Quiz3ViewController {
//            vc.scoreFromQuiz2 = scoreInQuiz2
//        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctOutlet.layer.cornerRadius = correctOutlet.frame.height / 2
        continueOutlet.isEnabled = false
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
