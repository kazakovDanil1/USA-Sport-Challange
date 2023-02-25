//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class TopContentView:
    UIView
{
    let notifyButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "NotifyBell")
        button.setImage(image, for: .normal)
        button.addTarget(
            nil,
            action: #selector(UIButton().underline),
            for: .touchUpInside
        )
        return button
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "SettingsGear")
        button.setImage(image, for: .normal)
        button.addTarget(
            nil,
            action: #selector(UIButton().underline),
            for: .touchUpInside
        )
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(notifyButton)
        stackView.addArrangedSubview(settingsButton)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    }
    
    func makeConstraints() {
        
        buttonStackView.snp.makeConstraints
        { make in
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview() .inset(10)
            make.height.equalTo(50)
        }
    }
}
