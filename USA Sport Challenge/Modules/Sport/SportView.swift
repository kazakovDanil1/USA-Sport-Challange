//Made by Kazakov.com
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class SportView:
    UIView
{
    let contentView = MainView("GrayBackground")
    
    let topContentView = TopContentView()
    
    private let chooseSport = ChooseSportButton(
        frame: .zero
    )
    
    private let hockey = SportImage(
        image: "Hockey"
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
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        addSubviews()
    }
    
    override func updateConstraintsIfNeeded() {
        super.layoutIfNeeded()
        makeMainConstraints()
        makeConstraints()
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
            chooseSport
        ].forEach {contentView.addSubview($0)}
        
        chooseSport.addSubview(hockey)
        chooseSport.addSubview(americanFootBall)
        chooseSport.addSubview(basketBall)
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
        
        chooseSport.snp.makeConstraints
        { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        hockey.snp.makeConstraints
        { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(chooseSport.snp.centerX) .offset(-20)
        }
        
        americanFootBall.snp.makeConstraints
        { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(chooseSport.snp.centerX) .offset(-20)
        }
        
        basketBall.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
