//Made by Kazakov.com
//USA Sport Challenge in 2023

import UIKit
import SnapKit

class SportViewController:
    UIViewController
{
    private lazy var contentView = self.view as? SportView
    private let settingsViewController = SettingsViewController()
    private let chosenSportViewController = ChosenSportViewController()
    
    private let viewModel: SportViewModelType
    
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
        bind()
    }
    
    func bind() {
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension SportViewController
{
    
    @objc func callSettings() {
        guard let contentView = contentView
        else {
            return
        }
    
        addChildViewController(
            settingsViewController,
            on: contentView.contentView
        )
    }
    
    @objc func callChosenSport() {
        guard let contentView = contentView
        else {
            return
        }

        addChildViewController(
            chosenSportViewController,
            on: contentView.contentView
        )
    }
    
    func remove() {
        removeChildView()
    }
    
    func addTargets() {
        guard let contentView = contentView
        else {
            return
        }
        contentView.topContentView.settingsButton.addTarget(
            self,
            action: #selector(callSettings),
            for: .touchUpInside
        )
        contentView.topContentView.notifyButton.addTarget(
            self,
            action: #selector(callChosenSport),
            for: .touchUpInside
        )
    }

}
