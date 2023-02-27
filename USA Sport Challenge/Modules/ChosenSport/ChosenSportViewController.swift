//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

class ChosenSportViewController:
    UIViewController
{
    private lazy var contentView = self.view as? ChosenSportView
    
    private let viewModel = ChosenSportViewModel()
    
    weak var delegate: ReturnBackFromViewControllerDelegate?
        
    override func loadView() {
        self.view = ChosenSportView(frame: UIScreen.main.bounds)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTarget()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        contentView?.backButton.makeShadows(radius: 5, shadowOpacity: 0.5)
    }
}

extension ChosenSportViewController
{
    func addTarget() {
        contentView?.backButton.addTarget(
            self,
            action: #selector(returnBack),
            for: .touchUpInside
        )
    }
    @objc func returnBack() {
        guard let delegate = delegate
        else {
            return
        }
        delegate.returnBack(self, name: "chosen")
    }
}
