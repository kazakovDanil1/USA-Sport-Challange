//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SnapKit
import EasyAnimation

enum AnimationDirection: String {
    case twelve = "up"
    case three = "threeHour"
    case halfPastFour = "halfPastFour"
    case halfPastSeven = "halfPastSeven"
    case nine = "nine"
}

class SportMenuButton:
    UIView
{
    
    lazy var americanFootBallContainer: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "vector1"), for: .normal)
        button.isHidden = true
        //        AmericanFootBall
        
        return button
    }()
    lazy var baseBallContainer: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "vector2"), for: .normal)
        button.isHidden = true
        //        BaseBall
        
        return button
    }()
    lazy var footBallContainer: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "vector3"), for: .normal)
        button.isHidden = true
        //        FootBall
        
        return button
    }()
    lazy var basketBallContainer: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "vector4"), for: .normal)
        button.isHidden = true
        //        BasketBall
        
        return button
    }()
    lazy var HockeyContainer: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "vector5"), for: .normal)
        button.isHidden = true
        //        Hockey
        
        return button
    }()
    lazy var chooseSport: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ChooseSportCircle"), for: .normal)
        button.frame.size = CGSize(width: 60, height: 60)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(americanFootBallContainer)
        self.addSubview(baseBallContainer)
        self.addSubview(basketBallContainer)
        self.addSubview(footBallContainer)
        self.addSubview(HockeyContainer)
        
        
        self.addSubview(chooseSport)
        chooseSport.addTarget(
            nil,
            action: #selector(circleSlideAnimate),
            for: .touchUpInside
        )
        
        updateConstraintsIfNeeded()
    }
    
    override func updateConstraintsIfNeeded() {
        super.updateConstraintsIfNeeded()
        
        makeConstraints()
    }
    
    func makeConstraints() {
        chooseSport.snp.makeConstraints { make in
            make.centerY.equalToSuperview() .offset(-50)
            make.centerX.equalToSuperview()
        }
        
        americanFootBallContainer.snp.makeConstraints { make in
            make.centerX.equalTo(chooseSport.snp.centerX)
            make.centerY.equalTo(chooseSport.snp.centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        baseBallContainer.snp.makeConstraints { make in
            make.centerX.equalTo(chooseSport.snp.centerX)
            make.centerY.equalTo(chooseSport.snp.centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        basketBallContainer.snp.makeConstraints { make in
            make.centerX.equalTo(chooseSport.snp.centerX)
            make.centerY.equalTo(chooseSport.snp.centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        footBallContainer.snp.makeConstraints { make in
            make.centerX.equalTo(chooseSport.snp.centerX)
            make.centerY.equalTo(chooseSport.snp.centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        HockeyContainer.snp.makeConstraints { make in
            make.centerX.equalTo(chooseSport.snp.centerX)
            make.centerY.equalTo(chooseSport.snp.centerY)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
    }
    
    @objc func circleSlideAnimate() {
        slideAnimation(
            object: americanFootBallContainer,
            direction: .twelve
        )
        slideAnimation(
            object: baseBallContainer,
            direction: .three
        )
        slideAnimation(
            object: footBallContainer,
            direction: .halfPastFour
        )
        slideAnimation(
            object: basketBallContainer,
            direction: .halfPastSeven
        )
        slideAnimation(
            object: HockeyContainer,
            direction: .nine
        )
    }
    
    @objc func sayHi() {
        print("hi")
    }
    
    func slideAnimation(
        object: UIView,
        direction: AnimationDirection
    ) {
        DispatchQueue.main.async {
            if object.isHidden {
                switch direction {
                case .twelve:
                    UIView.animate(
                        withDuration: 1.0,
                        animations: {
                            object.isHidden = false
                            object.layer.frame = CGRect(
                                x: self.chooseSport.frame.origin.x + 20,
                                y: self.chooseSport.frame.origin.y - 75,
                                width: 125,
                                height: 75
                            )})
                case .three:
                    UIView.animate(
                        withDuration: 1.0,
                        animations: {
                            object.isHidden = false
                            object.layer.frame = CGRect(
                                x: self.chooseSport.frame.origin.x + 165,
                                y: self.chooseSport.frame.origin.y + 20,
                                width: 75,
                                height: 125
                            )})
                case .halfPastFour:
                    UIView.animate(
                        withDuration: 1.0,
                        animations: {
                            object.isHidden = false
                            object.layer.frame = CGRect(
                                x: self.chooseSport.frame.origin.x + 85,
                                y: self.chooseSport.frame.origin.y + 175,
                                width: 125,
                                height: 100
                            )})
                case .halfPastSeven:
                    UIView.animate(
                        withDuration: 1.0,
                        animations: {
                            object.isHidden = false
                            object.layer.frame = CGRect(
                                x: self.chooseSport.frame.origin.x - 50,
                                y: self.chooseSport.frame.origin.y + 175,
                                width: 125,
                                height: 100
                            )})
                case .nine:
                    UIView.animate(
                        withDuration: 1.0,
                        animations: {
                            object.isHidden = false
                            object.layer.frame = CGRect(
                                x: self.chooseSport.frame.origin.x - 75,
                                y: self.chooseSport.frame.origin.y + 20,
                                width: 75,
                                height: 125
                            )})
                    
                }
            } else if !(object.isHidden) {
                UIView.animate(
                    withDuration: 1.0,
                    animations: {
                        object.layer.frame = CGRect(
                            x: self.chooseSport.frame.minX + 20,
                            y: self.chooseSport.frame.minY + 20,
                            width: object.frame.size.width,
                            height: object.frame.size.height
                        )})
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + 1) {
                        object.isHidden = true
                    }
            }
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
