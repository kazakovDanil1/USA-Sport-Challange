//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class MatchDetailsViewController:
    UIViewController
{
    lazy var contentView = self.view as? MatchDetailsView
    
    weak var delegate: ReturnBackDelegate?
    
    private let backButton = CircleButton(action: #selector(returnBack))
    
    override func loadView() {
        self.view = MatchDetailsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(backButton)
        
        makeConstraints()
        backButton.layer.cornerRadius = 20
    }
}

extension MatchDetailsViewController
{
    @objc func returnBack() {
        guard let delegate = delegate
        else {
            return
        }
        delegate.back(self)
    }
    
    func makeConstraints() {
        backButton.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            
            make.trailing.equalTo(self.view.snp.trailing)
                .offset(-20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
                .offset(-20)
        }
    }
    
}

