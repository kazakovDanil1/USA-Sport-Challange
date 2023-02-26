//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

final class CircleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor().elementColor
        setImage(UIImage(systemName: "return.left"), for: .normal)
        imageView?.layer.transform = CATransform3DMakeScale(1.8, 1.8, 2.5)
        self.makeShadows(
            radius: 15,
            shadowOpacity: 0.40
        )
    }
    
    convenience init(action: Selector) {
        self.init(frame: .zero)
        self.addTarget(nil, action: action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
