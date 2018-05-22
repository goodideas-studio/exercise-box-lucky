//
//  ViewController.swift
//  Game
//
//  Created by Peichun Tsai on 2018/5/15.
//  Copyright © 2018年 Peichun Tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBAction func backToMainBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

