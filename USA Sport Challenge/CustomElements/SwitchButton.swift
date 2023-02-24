//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

class SwitchButton:
    UIButton
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitle("Off", for: .normal)
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
