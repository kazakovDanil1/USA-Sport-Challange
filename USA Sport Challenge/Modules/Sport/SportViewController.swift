//Made by Kazakov.com
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class SportViewController:
    UIViewController
{
    private lazy var contentView = self.view as? SportView
    
    let viewModel: SportViewModelType
    let settingsViewController = SettingsViewController()
    
    override func loadView() {
        self.view = SportView(frame: UIScreen.main.bounds)
    }
    
    init(viewModel: SportViewModelType) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        addTargets()
    }
    
    func addTargets() {
        contentView?.settingsButton.addTarget(
            self,
            action: #selector(callSettings),
            for: .touchUpInside
        )
    }
    
    @objc func callSettings() {
        //settings
        addChild(settingsViewController)
        self.view.addSubview(settingsViewController.view)
        settingsViewController.didMove(toParent: self)
        makeConstraintsForSettings()
        //notifications
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension SportViewController
{
    
    func makeConstraintsForSettings() {
        guard let contentView = contentView else { return }
        
        settingsViewController.view.snp.makeConstraints { make in
            make.top.equalTo(contentView.topContentView.snp.bottomMargin) .offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
