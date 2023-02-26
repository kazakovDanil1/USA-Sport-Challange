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
        
        backgroundColor = UIColor().topColor
        layoutIfNeeded()
        updateConstraintsIfNeeded()
    }
    
//    override func hitTest(
//        _ point: CGPoint,
//        with event: UIEvent?
//    ) -> UIView? {
//       let biggerButtonFrame = matchStatesStackView.frame.insetBy(
//        dx: -30,
//        dy: -30
//       ) // 1
//
//       if biggerButtonFrame.contains(point) { // 2
//          return matchStatesStackView // 3
//       }
//
//       return super.hitTest(point, with: event) // 4
//    }
    
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
        
        buttonStackView.snp.makeConstraints
        { make in
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview() .inset(10)
            make.height.equalTo(50)
        }
        
        matchStatesStackView.snp.makeConstraints
        { make in
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}
