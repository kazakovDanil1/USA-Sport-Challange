//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

class ChosenSportView:
    UIView
{
    let contentView = MainView("GrayBackground")
    
    let exampleView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
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
    
    func makeConstraints() {
        exampleView.snp.makeConstraints
        { make in
            make.height.width.equalTo(300)
        }
        
    }
    
    func addSubs() {
        [
        exampleView
        ].forEach({
            contentView.addSubview($0)
        })
    }
}
