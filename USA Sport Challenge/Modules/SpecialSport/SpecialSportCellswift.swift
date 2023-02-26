//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class SpecialSportCell:
    UITableViewCell
{
    
    static let identifier = "SportCell"
    
    let taskLabel = UILabel()
    let deadLineLabel = UILabel()
    
    let cellView = UIView()
    
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
        cellView.addSubview(taskLabel)
        cellView.addSubview(deadLineLabel)
    }
    
    override func prepareForReuse() {
        taskLabel.text = nil
        deadLineLabel.text = nil
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
        
        taskLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
}

