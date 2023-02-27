//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class MatchDetailsView:
    UIView
{
    let contentView = MainView("GrayBackground")
    
    let scrollView = UIScrollView()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        
        return label
    }()
    
    let firstTeamPic = UIImageView()
    let secondTeamPic = UIImageView()
    
    let firstTeamPicLabel = UILabel()
    let secondTeamPicLabel = UILabel()
    
    let score: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = UIColor().AppGreenColor
        label.textAlignment = .center
        
        return label
    }()
    
    let statisticPicture: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "SoccerStatisticPicture")
        
        return image
    }()
    
    let statisticLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor().AppGreenColor
        label.font = .systemFont(ofSize: 25, weight: .bold)
        
        label.attributedText = NSAttributedString(
            string: "STATISTIC",
            attributes: [
            .underlineColor: UIColor.black.cgColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ])

        return label
    }()
    
    var statisticStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    let lastMatchesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor().AppGreenColor
        label.font = .systemFont(ofSize: 25, weight: .bold)
        
        label.attributedText = NSAttributedString(
            string: "LAST MATCHES",
            attributes: [
            .underlineColor: UIColor.black.cgColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ])

        return label
    }()
    
    var lastMatchesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
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

extension MatchDetailsView
{
    func commonInit() {
        addSubview(scrollView)
        
        scrollView.contentSize = CGSize(
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height + 1500
        )
        scrollView.contentInset = UIEdgeInsets(
            top: 0, left: 0,
            bottom: 0, right: 0
        )
        scrollView.frame = self.alignmentRect(
            forFrame: CGRect(
                origin: CGPoint(
                    x: 0,
                    y: 0),
                size: CGSize(
                    width: UIScreen.main.bounds.width,
                    height: 1500)))
        
        scrollView.addSubview(contentView)
        
        contentView.clipsToBounds = true
        contentView.frame = scrollView.bounds
    }
    
    func addSubs() {
        
        [dateLabel, score,
         firstTeamPic, firstTeamPicLabel,
         secondTeamPic, secondTeamPicLabel,
         statisticStackView, statisticLabel, statisticPicture
        ].forEach {contentView.addSubview($0)}
    }
    
    func makeConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview() .offset(70)
            make.centerX.equalTo(score.snp.centerX)
        }
        score.snp.makeConstraints { make in
            make.leading.equalTo(firstTeamPic.snp.trailing) .offset(20)
            make.trailing.equalTo(secondTeamPic.snp.leading) .offset(-20)
            make.centerY.equalTo(firstTeamPic.snp.centerY)
        }
        //MARK: - FIRST TEAM
        firstTeamPic.snp.makeConstraints { make in
            make.leading.equalToSuperview() .offset(40)
            make.top.equalTo(dateLabel.snp.bottom) .offset(20)
            make.height.width.equalTo(100)
        }
        
        firstTeamPicLabel.snp.makeConstraints { make in
            make.centerX.equalTo(firstTeamPic.snp.centerX)
            make.top.equalTo(firstTeamPic.snp.bottom)
        }
        //MARK: - SECOND TEAM
        secondTeamPic.snp.makeConstraints { make in
            make.trailing.equalToSuperview() .offset(-40)
            make.top.equalTo(dateLabel.snp.bottom) .offset(20)
            make.height.width.equalTo(100)
        }
        secondTeamPicLabel.snp.makeConstraints { make in
            make.centerX.equalTo(secondTeamPic.snp.centerX)
            make.top.equalTo(secondTeamPic.snp.bottom)
        }
        
        statisticLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTeamPicLabel.snp.bottom) .offset(10)
            make.leading.equalToSuperview() .offset(10)
            make.trailing.equalToSuperview()
        }
        
        statisticStackView.snp.makeConstraints { make in
            make.top.equalTo(statisticLabel.snp.bottom) .offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        statisticPicture.snp.makeConstraints { make in
            make.top.equalTo(statisticStackView.snp.bottom)
            make.leading.equalTo(statisticStackView.snp.leading)
            make.trailing.equalTo(statisticStackView.snp.trailing)
            make.height.equalTo(200)
        }
        
    }
}
