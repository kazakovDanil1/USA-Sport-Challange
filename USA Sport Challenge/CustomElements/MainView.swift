//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class MainView:
    UIView
{
    let backgroundView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(_ image: String) {
        self.init(frame: .zero)
        self.addSubview(backgroundView)
        makeConstraints()
        self.backgroundView.image = UIImage(named: image)
    }
    
    convenience init(_ backgroundColor: UIColor) {
        self.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func makeConstraints() {
        backgroundView.snp.makeConstraints
        { make in
            make.edges.equalToSuperview()
        }
    }
}


