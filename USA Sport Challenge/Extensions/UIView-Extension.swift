//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit


extension UIView
{
    func makeShadows(radius: Int, shadowOpacity: Float) {
        layer.shadowOffset = CGSize(width: -1, height: 10)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = CGFloat(radius)
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = false
    }
}
