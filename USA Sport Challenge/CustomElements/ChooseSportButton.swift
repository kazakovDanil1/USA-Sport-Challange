//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit


class ChooseSportButton:
    UIButton
{
    private let chooseSport: UIImageView = {
        let image = UIImageView()
        image.frame.size = CGSize(
            width: 61, height: 61
        )
        image.image = UIImage(
            named: "ChooseSportCircle"
        )
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(chooseSport)
        chooseSport.frame = self.bounds
        
        setImage(
            chooseSport.image, for: .normal
        )
    }
    
    convenience init(image: String, size: CGSize) {
        self.init(frame: .zero)
        let choosen = SportImage(image: image, size: size)
        choosen.layer.opacity = 0.3
        addSubview(choosen)
        
        choosen.frame = self.bounds
        
        setImage(
            choosen.image, for: .normal
        )
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}


