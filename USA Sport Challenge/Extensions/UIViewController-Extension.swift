//Made by Kazakov Danil
//USA Sport Challenge in 2023

import UIKit

extension UIViewController
{
    public func addChildViewController(
        _ childViewController: UIViewController,
        on containerView: UIView
    ) {
        self.addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
    }
    
    public func removeChildViewController(
        _ viewController: UIViewController
    ) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    public func removeChildView() {
        self.parent?.dismiss(animated: true)
    }
    
}
