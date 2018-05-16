//
//  EntryViewController.swift
//  Game
//
//  Created by PinguMac on 2018/5/16.
//  Copyright © 2018年 Peichun Tsai. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet weak var pokerRoundsLabel: UILabel!
  @IBOutlet weak var pokerScoresLabel: UILabel!
  @IBOutlet weak var diceRoundsLabel: UILabel!
  @IBOutlet weak var diceScoresLabel: UILabel!
  
  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    updateView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - View Method
  private func updateView() {
    pokerRoundsLabel.text = String(UserDefaults.getPokerGameRounds())
    pokerScoresLabel.text = String(UserDefaults.getPokerGameRecord())
    diceRoundsLabel.text = String(UserDefaults.getDiceGameRounds())
    diceScoresLabel.text = String(UserDefaults.getDiceGameRecord())
  }
  
  // MARK: - Unwind Method
  @IBAction func unwindToNotesViewController(segue: UIStoryboardSegue) {
  }
  
}
