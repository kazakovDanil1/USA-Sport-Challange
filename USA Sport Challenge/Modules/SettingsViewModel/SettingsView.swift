//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class SettingsView:
    UIView
{
    let contentView = MainView("GrayBackground")
    
    lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        
        return view
    }()
    
    let soundButton: SwitchButton = {
        let button = SwitchButton()
        button.addTarget(
            self,
            action: #selector(UIButton().switchable),
            for: .touchUpInside
        )
        
        return button
    }()
    
    let calendarNoteButton: SwitchButton = {
        let button = SwitchButton()
        button.addTarget(
            self,
            action: #selector(UIButton().switchable),
            for: .touchUpInside
        )
        
        return button
    }()
    
    let backButton = CustomButton(title: "back")
    
    let soundLabel = CustomLabel(
        title: "SOUND",
        ofSize: 16,
        weight: .bold
    )
    let calendarLabel = CustomLabel(
        title: "ADD MARKED MATCH IN CALENDAR",
        ofSize: 16,
        weight: .bold
    )
    let eventLabel = CustomLabel(
        title: "START EVENT WITH",
        ofSize: 16,
        weight: .bold
    )
    
    private let americanFootBall = ChooseSportButton(
        image: "AmericanFootBall",
        size: CGSize(width: 39, height: 25)
    )
    private let basketBall = ChooseSportButton(
        image: "BasketBall",
        size: CGSize(width: 32, height: 32)
    )
    private let footBall = ChooseSportButton(
        image: "FootBall",
        size: CGSize(width: 32, height: 32)
    )
    private let baseBall = ChooseSportButton(
        image: "BaseBall",
        size: CGSize(width: 27, height: 27)
    )
    private let hockey = ChooseSportButton(
        image: "Hockey",
        size: CGSize(width: 42, height: 31)
    )
    
    lazy var sportsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        
        stackView.addArrangedSubview(americanFootBall)
        stackView.addArrangedSubview(basketBall)
        stackView.addArrangedSubview(footBall)
        stackView.addArrangedSubview(baseBall)
        stackView.addArrangedSubview(hockey)
        return stackView
    }()
    
    lazy var fullStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        
        
        stackView.addArrangedSubview(sportsStackView)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.addSubview(backButton)
        
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
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension SettingsView
{
    func commonInit() {
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
    func addSubs() {
        [
            menuView
        ].forEach({
            contentView.addSubview($0)
        })
        
        [
            fullStackView,
            eventLabel,
            calendarNoteButton,
            calendarLabel,
            soundButton,
            soundLabel
        ].forEach({
            menuView.addSubview($0)
        })
        
    }
    
    func makeConstraints() {
        menuView.snp.makeConstraints { make in
            make.top.equalToSuperview() .offset(10)
            make.leading.equalToSuperview() .offset(10)
            make.trailing.equalToSuperview() .inset(10)
            make.height.equalTo(267)
        }
        
        fullStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview() .offset(-20)
            make.leading.equalToSuperview() .offset(10)
            make.trailing.equalToSuperview() .inset(10)
            make.height.equalTo(40)
        }
        
        eventLabel.snp.makeConstraints { make in
            make.centerX.equalTo(fullStackView.snp.centerX)
            make.bottom.equalTo(fullStackView.snp.top) .offset(-10)
        }
        
        calendarNoteButton.snp.makeConstraints { make in
            make.centerX.equalTo(fullStackView.snp.centerX)
            make.bottom.equalTo(eventLabel.snp.top) .offset(-10)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        calendarLabel.snp.makeConstraints { make in
            make.centerX.equalTo(fullStackView.snp.centerX)
            make.bottom.equalTo(calendarNoteButton.snp.top) .offset(-10)
        }
        
        soundButton.snp.makeConstraints { make in
            make.centerX.equalTo(fullStackView.snp.centerX)
            make.bottom.equalTo(calendarLabel.snp.top) .offset(-10)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        soundLabel.snp.makeConstraints { make in
            make.centerX.equalTo(fullStackView.snp.centerX)
            make.bottom.equalTo(soundButton.snp.top) .offset(-10)
            make.top.equalToSuperview() .offset(20)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.centerY) .offset(100)
            make.height.equalTo(50)
            make.leading.equalToSuperview() .offset(20)
            make.trailing.equalToSuperview() .offset(-20)
        }
    
        
    }
}
