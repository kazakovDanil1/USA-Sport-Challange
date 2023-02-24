//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

class ChosenSportViewController:
    UIViewController
{
    private lazy var contentView = self.view as? ChosenSportView
    
    let viewModel = ChosenSportViewModel()
    
    override func loadView() {
        self.view = ChosenSportView(frame: UIScreen.main.bounds)
        print("ChosenSportViewController is loaded")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        contentView?.exampleView.makeShadows(radius: 5, shadowOpacity: 0.5)
    }
    
    deinit {
        print("dealocated")
    }
}
