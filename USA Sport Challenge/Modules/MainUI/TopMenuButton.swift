//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

class TopMenuButton:
    UIButton
{

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addUnderLine()
        self.backgroundColor = UIColor().topColor
    }
    
    convenience init(image: String) {
        self.init(frame: .zero)
        setImage(UIImage(named: image), for: .normal)
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        setTitleColor(.white, for: .normal)
        setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
