//Made by Kazakov.com
//USA Sport Challenge in 2023

import UIKit
import SnapKit

protocol ReturnBackFromViewControllerDelegate: AnyObject
{
    func returnBack(_ from: UIViewController)
}


class SportViewController:
    UIViewController
{

    private lazy var contentView = self.view as? SportView
    private let settingsViewController = SettingsViewController()
    private let chosenSportViewController = ChosenSportViewController()
    private let specialSportViewController = SpecialSportViewController()
    
    private let viewModel: SportViewModelType?
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        guard let sportMenu = contentView?.sportMenuButton
        else {
            return
        }
        
        sportMenu.americanFootBallContainer.addTarget(
            self,
            action: #selector(enterSpecialSport),
            for: .touchUpInside
        )

    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension SportViewController:
    ReturnBackFromViewControllerDelegate
{
    func returnBack(_ from: UIViewController) {
        removeChildViewController(from)
        
        if from == specialSportViewController {
            dropAnimation()
        }
    }
}

extension SportViewController
{
    
    func dropAnimation() {
        DispatchQueue.main.async {
            self.contentView?.sportMenuButton.slideAnimation(
                object: (
                    self.contentView?.topContentView.matchStatesStackView.self)!,
                direction: .drop
            )
        }
    }
    
    @objc func enterSpecialSport() {
        guard let contentView = contentView
        else {
            return
        }
        dropAnimation()
        addChildViewController(
            specialSportViewController,
            on: contentView.contentView
        )
        specialSportViewController.delegate = self
    }
    
    @objc func callSettings() {
        guard let contentView = contentView
        else {
            return
        }
        
        addChildViewController(
            settingsViewController,
            on: contentView.contentView
        )
        settingsViewController.delegate = self
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
        chosenSportViewController.delegate = self
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
