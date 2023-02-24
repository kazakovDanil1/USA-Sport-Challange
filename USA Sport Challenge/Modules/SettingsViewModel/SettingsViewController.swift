//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit


class SettingsViewController:
    UIViewController
{
    
    private lazy var contentView = self.view as? SettingsView
    
    let viewModel = SettingsViewModel()
    
    override func loadView() {
        self.view = SettingsView(frame: UIScreen.main.bounds)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let contentView = contentView else { return }
        
        contentView.menuView.makeShadows(radius: 5, shadowOpacity: 0.5)
        contentView.menuView.layer.cornerRadius = 20
        
        contentView.calendarNoteButton.makeShadows(radius: 5, shadowOpacity: 0.2)
        contentView.calendarNoteButton.layer.cornerRadius = 10
        
        contentView.soundButton.makeShadows(radius: 5, shadowOpacity: 0.2)
        contentView.soundButton.layer.cornerRadius = 10
        
    }
    
    
    
    
}
