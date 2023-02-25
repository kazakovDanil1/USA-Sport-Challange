//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit


class ChooseSportButton:
    UIButton
{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(image: String, size: CGSize) {
        self.init(frame: .zero)
        
        let sportPic = SportImage(
            image: image,
            size: size
        )
        
        addSubview(sportPic)
        
        sportPic.frame = self.bounds
        
        setImage(
            sportPic.image,
            for: .normal
        )
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}


