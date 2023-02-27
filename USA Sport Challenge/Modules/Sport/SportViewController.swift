//Made by Kazakov.com
//USA Sport Challenge in 2023

import UIKit
import SnapKit

protocol ReturnBackFromViewControllerDelegate:
    AnyObject
{
    func returnBack(_ from: UIViewController, name: String)
}

class SportViewController:
    UIViewController
{
    
    private lazy var contentView = self.view as? SportView
    private let settingsViewController = SettingsViewController()
    private let chosenSportViewController = ChosenSportViewController()
    private let specialSportViewController: SpecialSportViewController? = nil
    
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
        
        sportMenu.footBallContainer.addTarget(
            self,
            action: #selector(enterSoccerSport),
            for: .touchUpInside
        )
        sportMenu.americanFootBallContainer.addTarget(
            self,
            action: #selector(enterAmericanfootballSport),
            for: .touchUpInside
        )
        sportMenu.basketBallContainer.addTarget(
            self,
            action: #selector(enterBaseballSport),
            for: .touchUpInside
        )
        sportMenu.HockeyContainer.addTarget(
            self,
            action: #selector(enterIceHockeySport),
            for: .touchUpInside
        )
        sportMenu.baseBallContainer.addTarget(
            self,
            action: #selector(enterSoccerSport),
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
    func returnBack(_ from: UIViewController, name: String) {
        removeChildViewController(from)
        
        if name == "special" {
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
    
    @objc func enterSoccerSport() {
        guard let contentView = contentView
        else {
            return
        }
        dropAnimation()
        
        let specialSportViewController = SpecialSportViewController(
            viewModel: SpecialSportViewModel(
                sport: .soccer
            )
        )
        let matchVC = MatchDetailsViewController()
        
        addChildViewController(
            specialSportViewController,
            on: contentView.contentView
        )
        specialSportViewController.delegate = self
    }
    
    @objc func enterBasketballSport() {
        guard let contentView = contentView
        else {
            return
        }
        dropAnimation()
        let specialSportViewController = SpecialSportViewController(
            viewModel: SpecialSportViewModel(
                sport: .basketball
            )
        )
        
        addChildViewController(
            specialSportViewController,
            on: contentView.contentView
        )
        specialSportViewController.delegate = self
    }
    
    @objc func enterBaseballSport() {
        guard let contentView = contentView
        else {
            return
        }
        dropAnimation()
        let specialSportViewController = SpecialSportViewController(
            viewModel: SpecialSportViewModel(
                sport: .baseball
            )
        )
        
        addChildViewController(
            specialSportViewController,
            on: contentView.contentView
        )
        specialSportViewController.delegate = self
    }
    @objc func enterIceHockeySport() {
        guard let contentView = contentView
        else {
            return
        }
        dropAnimation()
        let specialSportViewController = SpecialSportViewController(
            viewModel: SpecialSportViewModel(
                sport: .icehockey
            )
        )
        
        addChildViewController(
            specialSportViewController,
            on: contentView.contentView
        )
        specialSportViewController.delegate = self
    }
    
    @objc func enterAmericanfootballSport() {
        guard let contentView = contentView
        else {
            return
        }
        dropAnimation()
        let specialSportViewController = SpecialSportViewController(
            viewModel: SpecialSportViewModel(
                sport: .americanfootball
            )
        )
        
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
