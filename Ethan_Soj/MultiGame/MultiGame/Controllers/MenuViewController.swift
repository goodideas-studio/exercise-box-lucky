//
//  ViewController.swift
//  MultiGame
//
//  Created by EthanLin on 2018/5/16.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var game1PlayTimesLabel: UILabel!
    @IBOutlet weak var game1HighestLabel: UILabel!
    
    @IBOutlet weak var game2PlayTimesLabel: UILabel!
    @IBOutlet weak var game2HighestLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var game1PlayTimes = UserDefaults.standard.integer(forKey: "game1PlayTimes")
        game1PlayTimesLabel.text = "玩了\(game1PlayTimes)次"
        game1HighestLabel.text = "歷史最高\(UserDefaults.standard.integer(forKey: "game1HighestScore"))分"
        
        game2PlayTimesLabel.text = "玩了\(UserDefaults.standard.integer(forKey: "game2PlayTimes"))次"
        game2HighestLabel.text = "歷史最高\(UserDefaults.standard.integer(forKey: "game2HighestScore"))分"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

