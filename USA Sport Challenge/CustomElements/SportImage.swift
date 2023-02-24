//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit


class SportImage:
    UIImageView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    convenience init(image: String) {
        self.init(frame: .zero)
        
        self.image = UIImage(named: image)
    }
    
    
    convenience init(image: String, size: CGSize) {
        self.init(frame: .zero)
        self.image = UIImage(named: image)
        frame.size = size
    }
}
