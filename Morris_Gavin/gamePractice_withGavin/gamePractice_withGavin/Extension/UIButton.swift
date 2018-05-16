
import UIKit

extension UIButton {
    func shake() {
        let shakeAnimate = CABasicAnimation(keyPath: "Position")
        shakeAnimate.duration = 0.2
        shakeAnimate.repeatDuration = 2
        shakeAnimate.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shakeAnimate.fromValue = fromValue
        shakeAnimate.toValue = toValue
        
        layer.add(shakeAnimate, forKey: nil)
    }
}

