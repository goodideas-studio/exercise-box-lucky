import UIKit

struct RPS {
    static let paper = "paper"
    static let rock = "rock"
    static let scissors = "scissors"
}

struct GameRule {
    static let win = "win"
    static let lose = "lose"
}


class JeremyViewController: UIViewController {
    
    let RPSImage = [RPS.paper,RPS.rock,RPS.scissors]
    var player = Player()
    var random = ""
    var winOrLose = ""
    
    //RPS Outlet
    @IBOutlet weak var firstLineImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    
    @IBOutlet weak var playerStatusStackView: UIStackView!
    @IBOutlet weak var rpsStackView: UIStackView!
    
    // GameOver view
    @IBOutlet weak var gameOverView: UIView!
    @IBOutlet weak var spourtsLabel: UILabel!

    @IBAction func restartGame(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.gameView.transform = CGAffineTransform.identity
            self.rpsStackView.transform = CGAffineTransform.identity
        }
        
        self.playerStatusStackView.isHidden = false
        
        player.life = 3
        player.score = 0
        scoreLabel.text = "Your score：\(player.score)"
        lifeLabel.text = "Your life：\(player.life)"
    }
    
    
    //RPS Action
    
    @IBAction func RPSAction(_ sender: UIButton) {
//        print(RPSImage[sender.tag], random)
        if player.score == 0 && player.life == 3 {
            GameBoard.current.gameOneTimes += 1
            UserDefaults.standard.set(GameBoard.current.gameOneTimes, forKey: "GameOneTimes")
        }
        
        if winOrLose == GameRule.win {
            if winGame(playerChoose: RPSImage[sender.tag], computerChoose: random) {
                imageLeave()
            } else {
                checkLife()
                return
            }
        } else {
            if loseGame(playerChoose: RPSImage[sender.tag], computerChoose: random) {
                imageLeave()
            } else {
                checkLife()
                return
            }
        }
        
        self.firstLineImage.center.x = 0
        self.firstLineImage.center.x -= 300
        self.rpsRandom()

        imageToCenter()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rpsRandom()
        firstLineImage.center = self.gameView.center
        
        // Do any additional setup after loading the view, typically from a nib.

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imageToCenter() {
        UIView.animate(withDuration: 0.4) {
            self.firstLineImage.frame.origin = CGPoint(x:19.5, y: 66.5)
        }
    }
    
    func imageLeave() {
        player.score += 10
        scoreLabel.text = "Your score:\(player.score)"
        UIView.animate(withDuration: 0.4) {
            self.firstLineImage.center.x += 500
        }
    }
    
    func rpsRandom() {
        let randomNumber = Int(arc4random() % 3)
        random = RPSImage[randomNumber]
        firstLineImage.image = UIImage(named: random)
        
        if randomNumber / 2 == 0 {
            winOrLose = GameRule.win
            gameTitle.text = "You have to Win"
        } else {
            winOrLose = GameRule.lose
            gameTitle.text = "You have to Lose"
        }
    }
    
    func winGame(playerChoose:String,computerChoose:String) -> Bool {
        switch (playerChoose,computerChoose) {
        case (RPS.paper,RPS.rock):
            return true
        case (RPS.rock,RPS.scissors):
            return true
        case (RPS.scissors,RPS.paper):
            return true
        default:
            return false
        }
    }
    
    func loseGame(playerChoose:String,computerChoose:String) -> Bool {
        switch (playerChoose,computerChoose) {
        case (RPS.rock,RPS.paper):
            return true
        case (RPS.scissors,RPS.rock):
            return true
        case (RPS.paper,RPS.scissors):
            return true
        default:
            return false
        }
    }
    
    func checkLife() {
        player.life -= 1
        lifeLabel.text = "Your life：\(player.life)"
        if player.life <= 0 {
            GameBoard.current.gameOneScore = max(GameBoard.current.gameOneScore, player.score)
            UserDefaults.standard.set(GameBoard.current.gameOneScore, forKey: "GameOneScore")
            print("你死了")
            gameOver()
        }
    }
    
    func gameOver() {
        UIView.animate(withDuration: 1) {
            self.gameView.transform = CGAffineTransform(translationX: 1000, y: 0)
            self.rpsStackView.transform = CGAffineTransform(translationX: -1000, y: 0)
            self.playerStatusStackView.isHidden = true
        }
        UIView.animate(withDuration: 2) {
            self.spourtsLabel.alpha = 1
        }
        
    }
    
    
}

