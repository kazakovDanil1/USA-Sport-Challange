//Made by Kazakov.com
//USA Sport Challenge in 2023

import UIKit

class SportView:
    UIView
{
    
    let contentView = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init(coder: NSCoder) {
        fatalError()
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        addSubviews()
    }
    override func updateConstraintsIfNeeded() {
        super.layoutIfNeeded()
        makeConstraints()
    }
}

extension SportView
{
    
    func commonInit() {
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    func addSubviews() {
        
    }
    func makeConstraints() {
        
    }
}
