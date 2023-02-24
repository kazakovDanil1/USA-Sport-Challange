//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit


extension UIView {
    
//    func dropShadow() {
//        layer.masksToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.5
//        layer.shadowOffset = CGSize(width: 10, height: 10)
//        layer.shadowRadius = 1
//        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale
//    }

    
    func makeShadows(radius: Int, shadowOpacity: Float) {
        layer.shadowOffset = CGSize(width: -1, height: 10)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = CGFloat(radius)
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = false
    }
}
