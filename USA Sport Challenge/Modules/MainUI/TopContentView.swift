//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class TopContentView:
    UIView
{
    let notifyButton = TopMenuButton(image: "NotifyBell")
    let settingsButton = TopMenuButton(image: "SettingsGear")
    
    let endedButton = TopMenuButton(title: "Ended")
    let liveButton = TopMenuButton(title: "Live")
    let comingButton = TopMenuButton(title: "Coming up")
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(notifyButton)
        stackView.addArrangedSubview(settingsButton)
        
        return stackView
    }()
    
    lazy var matchStatesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(endedButton)
        stackView.addArrangedSubview(liveButton)
        stackView.addArrangedSubview(comingButton)
        stackView.isHidden = true
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        notifyButton.setImage(
            UIImage(
                systemName: "bell.fill"),
            for: .normal
        )
        notifyButton.tintColor = UIColor().elementColor
        notifyButton.contentMode = .scaleAspectFit
        
        settingsButton.setImage(
            UIImage(
                systemName: "gearshape.fill"),
            for: .normal
        )
        settingsButton.tintColor = UIColor().elementColor
        
        backgroundColor = UIColor().topColor
        layoutIfNeeded()
        updateConstraintsIfNeeded()
    }
        
    required init?(coder: NSCoder) {
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

extension TopContentView
{
    
    func addSubviews() {
       addSubview(buttonStackView)
       addSubview(matchStatesStackView)
    }
    
    func makeConstraints() {
        
//        notifyButton.snp.makeConstraints { make in
//            make.width.height.equalTo(40)
//        }
//
//        settingsButton.snp.makeConstraints { make in
//            make.width.height.equalTo(150)
//        }
        
        
        buttonStackView.snp.makeConstraints
        { make in
            make.top.equalToSuperview() .offset(20)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(50)
        }
        
        matchStatesStackView.snp.makeConstraints
        { make in
            make.top.equalTo(buttonStackView.snp.bottom) .offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        }
    }

