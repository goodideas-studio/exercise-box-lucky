//
//  mainViewController.swift
//  Sonny_Ells
//
//  Created by Sonny on 2018/5/16.
//

import UIKit

class mainViewController: UIViewController {

    let userDefault = UserDefaults.standard
    @IBOutlet weak var firstTimesLabel: UILabel!
    @IBOutlet weak var secondTimesLabel: UILabel!
    
    @IBOutlet weak var GNHeightScoreLabel: UILabel!
    @IBOutlet weak var HSHHeightScoreLabel: UILabel!
    @IBAction func CrazyBtn(_ sender: Any) {

    }
    
    @IBAction func HeroBtn(_ sender: Any) {

    }
    
    var GNplayTimes:Int = 0
    var HSHplayTimes:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillLayoutSubviews() {
        
        var GNplayedTimes = userDefault.integer(forKey: "GNPlayTimes")
        firstTimesLabel.text = "\(GNplayedTimes)"
        
//        secondTimesLabel.text = "\(HSHplayTimes)"
        var HSHpalyedTimes = userDefault.integer(forKey: "HSHPlayTimes")
        secondTimesLabel.text = "\(HSHpalyedTimes)"
        
        var GNHeightScore = userDefault.integer(forKey: "GNHeightScore")
        GNHeightScoreLabel.text = "\(GNHeightScore)"
        
        var HSHHeightScore = userDefault.integer(forKey: "HSHHeightScore")
        HSHHeightScoreLabel.text = "\(HSHHeightScore)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
