//
//  PlayerModel.swift
//  Game
//
//  Created by JeremyXue on 2018/5/15.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import Foundation

struct Player {
    var life = 3
    var score = 0
    static var correctCount = 0

}

struct UserDefaultKey {
    static let rpsHighScore = "rpsHighScore"
    static let playRpsCount = "rpsCount"
    static let guessHighScore = "guessHighScore"
    static let playGuessCount = "guessCount"
}
