//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

class SpecialSportTableView:
    UITableView
{
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
 
//        let view = UIImageView(image: UIImage(named: "GrayBackground"))
//
//        backgroundView = view
        
        backgroundColor = .white
        separatorStyle = .none
        sectionFooterHeight = 5
        sectionHeaderHeight = 5
        showsVerticalScrollIndicator = false
        register(
            SpecialSportCell.self,
            forCellReuseIdentifier: SpecialSportCell.identifier
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
