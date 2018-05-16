import Foundation

class GameBoard {
    
    static let current = GameBoard()
    
    private init() { }
    
    var gameOneScore = UserDefaults.standard.integer(forKey: "GameOneScore")
    var gameOneTimes = UserDefaults.standard.integer(forKey: "GameOneTimes")
    var gameTwoScore = UserDefaults.standard.integer(forKey: "GameTwoScore")
    var gameTwoTimes = UserDefaults.standard.integer(forKey: "GameTwoTimes")

}
