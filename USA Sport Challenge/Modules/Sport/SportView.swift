//Made by Kazakov.com
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class SportView:
    UIView
{
    let contentView = MainView("GrayBackground")
    
    let topContentView = MainView(UIColor().topColor)
    
    let notifyButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "NotifyBell")
        button.setImage(image, for: .normal)
        button.addTarget(
            self,
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
            self,
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
        [
            chooseSport,
            topContentView
        ].forEach {contentView.addSubview($0)}
        
        chooseSport.addSubview(hockey)
        chooseSport.addSubview(americanFootBall)
        chooseSport.addSubview(basketBall)
        
        topContentView.addSubview(buttonStackView)
    }
    
    func makeConstraints() {
        
        topContentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(contentView.frame.size.height / 6)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview() .inset(10)
            make.height.equalTo(50)
        }
        
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
