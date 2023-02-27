//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class SpecialSportCell:
    UITableViewCell
{
    
    static let identifier = "SportCell"
    
    let cellView = UIView()
    
    lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(
            ofSize: 15,
            weight: .semibold
        )
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: 15,
            weight: .thin
        )
        return label
    }()

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: 15,
            weight: .thin
        )
        return label
    }()

    lazy var firstTeam: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: 15,
            weight: .light
        )
        return label
    }()
    lazy var secondTeam: UILabel = {
        let label = UILabel()
        label.font = .systemFont(
            ofSize: 15,
            weight: .light
        )
        return label
    }()
    
    lazy var firstTeamScore: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .systemFont(
            ofSize: 15,
            weight: .bold
        )
        return label
    }()
    
    lazy var secondTeamScore: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = .systemFont(
            ofSize: 15,
            weight: .bold
        )
        return label
    }()
    
    lazy var notifyBell: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "bell.fill")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor().elementColor
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutIfNeeded()
        updateConstraintsIfNeeded()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        commonInit()
        addCellSubviews()
    }
    
    override func updateConstraintsIfNeeded() {
        super.updateConstraintsIfNeeded()
        
        makeConstraints()
    }
    
    func addCellSubviews() {
        cellView.addSubview(stateLabel)
        cellView.addSubview(statusLabel)
        cellView.addSubview(dateLabel)
        cellView.addSubview(firstTeam)
        cellView.addSubview(secondTeam)
        cellView.addSubview(firstTeamScore)
        cellView.addSubview(secondTeamScore)
        cellView.addSubview(notifyBell)
    }
    
    override func prepareForReuse() {
        stateLabel.text = nil
        statusLabel.text = nil
        dateLabel.text = nil
        firstTeam.text = nil
        secondTeam.text = nil
        firstTeamScore.text = nil
        secondTeamScore.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SpecialSportCell
{
    func commonInit() {
        contentView.addSubview(cellView)
        cellView.frame = contentView.bounds
    }
    
    func makeConstraints() {
        cellView.snp.makeConstraints { make in
            make.leading.equalToSuperview() .offset(20)
            make.trailing.equalToSuperview() .offset(-20)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        stateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview() .offset(5)
            make.leading.equalToSuperview() .offset(10)
        }
        statusLabel.snp.makeConstraints { make in
            make.centerY.equalTo(stateLabel.snp.centerY)
            make.leading.equalTo(stateLabel.snp.trailing) .offset(10)
            
        }
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(statusLabel.snp.centerY)
            make.leading.equalTo(statusLabel.snp.trailing) .offset(10)
        }
        firstTeam.snp.makeConstraints { make in
            make.leading.equalToSuperview() .offset(10)
            make.top.equalTo(stateLabel.snp.bottom) .offset(10)
            
        }
        secondTeam.snp.makeConstraints { make in
            make.top.equalTo(firstTeam.snp.bottom) .offset(10)
            make.leading.equalTo(firstTeam.snp.leading)
            make.bottom.equalToSuperview() .offset(-10)
            
        }
        notifyBell.snp.makeConstraints { make in
            make.centerY.equalTo(dateLabel.snp.centerY)
            make.trailing.equalToSuperview() .offset(-10)
            make.height.width.equalTo(30)
        }
        firstTeamScore.snp.makeConstraints { make in
            make.trailing.equalToSuperview() .offset(-10)
            make.centerX.equalTo(notifyBell.snp.centerX)
            make.top.equalTo(notifyBell.snp.bottom)
        }
    }
}
