//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

class CustomLabel:
    UILabel
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(
        title: String,
        ofSize: CGFloat,
        weight: UIFont.Weight
    ) {
        self.init(frame: .zero)
        self.text = title
        self.textColor = .black
        self.font = .systemFont(ofSize: ofSize, weight: weight)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}


