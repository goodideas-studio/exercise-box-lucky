//
//  Notification_Extension.swift
//  gamePractice_withGavin
//
//  Created by Morris on 2018/5/16.
//  Copyright © 2018年 Morris. All rights reserved.
//

import Foundation



extension Notification.Name {
    
    static let resultFromGuess = Notification.Name(rawValue: "resultFromGuess")
    
    static let resultFromDice = Notification.Name(rawValue: "resultFromDice")
    
    static let playTimesFromGuess = Notification.Name(rawValue: "playTimesFromGuess")
    
    static let playTimesFromDice = Notification.Name(rawValue: "playTimesFromDice")

}
