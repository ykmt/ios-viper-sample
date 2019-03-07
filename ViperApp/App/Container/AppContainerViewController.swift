// AppContainerViewController.swift

import UIKit

/// Viper

protocol AppContainerViper {
    var presenter: AppContainerPresenter? { get set }
}

/// View Behavior

protocol AppContainerViewBehavior: ViewBehavior {
    func setBackgroundColor(_ color: UIColor)
}

/// View

class AppContainerViewController: UIViewController, AppContainerViper, AppContainerViewBehavior{

    var presenter: AppContainerPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDelegate.viewDidLoad()
    }

    // MARK: - Behavior
    
    func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
        view.setNeedsDisplay()
    }
    
}
