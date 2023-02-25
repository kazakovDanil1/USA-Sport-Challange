//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class ChosenSportView:
    UIView
{
    let contentView = MainView("GrayBackground")
    
    lazy var backButton = CustomButton(title: "back")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        layoutIfNeeded()
        updateConstraintsIfNeeded()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        addSubs()
    }
    
    override func updateConstraintsIfNeeded() {
        super.updateConstraintsIfNeeded()
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension ChosenSportView
{
    func commonInit() {
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
    func addSubs() {
        [
            backButton
        ].forEach({
            contentView.addSubview($0)
        })
    }
    
    func makeConstraints() {
        backButton.snp.makeConstraints { make in
           
            make.leading.equalTo(contentView.snp.leading) .offset(20)
            make.trailing.equalTo(contentView.snp.trailing) .offset(-20)
            make.top.equalTo(contentView.snp.top) .offset(50)
        }
        
    }

}
