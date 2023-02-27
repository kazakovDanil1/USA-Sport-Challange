//Made by Kazakov.com
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class SportView:
    UIView
{
    let topContentView = TopContentView()
    
    let contentView = MainView("GrayBackground")
    
    let sportMenuButton = SportMenuButton()
    
    private let baseBall = SportImage(
        image: "BaseBall"
    )
    private let americanFootBall = SportImage(
        image: "AmericanFootBall"
    )
    private let basketBall = SportImage(
        image: "BasketBall"
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        commonInit()
        layoutIfNeeded()
        updateConstraintsIfNeeded()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        sportMenuButton.frame = self.bounds
        addSubviews()
    }
    
    override func updateConstraintsIfNeeded() {
        super.layoutIfNeeded()
        makeMainConstraints()
        makeConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension SportView
{
    func commonInit() {
        addSubview(contentView)
        addSubview(topContentView)
    }
    
    func addSubviews() {
        [
            sportMenuButton
        ].forEach {contentView.addSubview($0)}
        
        sportMenuButton.addSubview(baseBall)
        sportMenuButton.addSubview(americanFootBall)
        sportMenuButton.addSubview(basketBall)
    }
    
    func makeMainConstraints() {

        topContentView.snp.makeConstraints
        { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height / 6)
        }
        contentView.snp.makeConstraints
        { make in
            make.top.equalTo(topContentView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func makeConstraints() {
        basketBall.snp.makeConstraints
        { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview() .offset(-100)
        }
    }
}
