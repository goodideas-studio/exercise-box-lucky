//
//  UserDefault.swift
//  Game
//
//  Created by PinguMac on 2018/5/16.
//  Copyright © 2018年 Peichun Tsai. All rights reserved.
//

import Foundation

extension UserDefaults {
  enum Keys {
    static let pokerGameRounds = "pokerGameRounds"
    static let diceGameRounds = "diceGameRounds"
    static let pokerGameRecord = "pokerGameRecord"
    static let diceGameRecord = "diceGameRecord"
  }
  
  // MARK: - Poker Game Rounds
  static func getPokerGameRounds() -> Int {
    let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.pokerGameRounds)
    return storedValue
  }
  
  static func setPokerGameRounds(round: Int) {
    UserDefaults.standard.set(round, forKey: UserDefaults.Keys.pokerGameRounds)
  }
  
  // MARK: - Dice Game Rounds
  static func getDiceGameRounds() -> Int {
    let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.diceGameRounds)
    return storedValue
  }
  
  static func setDiceGameRounds(round: Int) {
    UserDefaults.standard.set(round, forKey: UserDefaults.Keys.diceGameRounds)
  }
  
  // MARK: - Poker Game Scores
  static func getPokerGameRecord() -> Int {
    let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.pokerGameRecord)
    return storedValue
  }
  
  static func setPokerGameRecord(score: Int) {
    UserDefaults.standard.set(score, forKey: UserDefaults.Keys.pokerGameRecord)
  }
  
  // MARK: - Dice Game Scores
  static func getDiceGameRecord() -> Int {
    let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.diceGameRecord)
    return storedValue
  }
  
  static func setDiceGameRecord(score: Int) {
    UserDefaults.standard.set(score, forKey: UserDefaults.Keys.diceGameRecord)
  }
}
