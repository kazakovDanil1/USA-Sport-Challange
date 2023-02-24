//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

extension UIButton
{
    
    @objc func switchAble() {
        
        if self.titleLabel?.text == "Off" {
            self.setTitle("On", for: .normal)
            backgroundColor = #colorLiteral(red: 0.9991982579, green: 0.6899703145, blue: 0.08480066806, alpha: 1)
        } else if self.titleLabel?.text == "On" {
            self.setTitle("Off", for: .normal)
            backgroundColor = .gray
        }

    }
    
    @objc func underline() {
        let greenIndicator: UIView = {
            let view = UIView(
                frame: CGRect(
                    x: -self.bounds.minX,
                    y: 55,
                    width: UIScreen.main.bounds.width / 2,
                    height: 5))
            view.backgroundColor = .green
            return view
        }()
        
        if self.isHighlighted {
            self.addSubview(greenIndicator)
        }
    }
    
}
