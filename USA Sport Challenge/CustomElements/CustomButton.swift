//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

class CustomButton:
    UIButton
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor().elementColor
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
    
    convenience init(title: String) {
        self.init(frame: .zero)
        
        setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
}
