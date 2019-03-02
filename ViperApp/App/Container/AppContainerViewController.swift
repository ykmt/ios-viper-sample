// AppContainerViewController.swift

import UIKit

/// App Container View Viper

protocol AppContainerViewViper {
    var presenter: AppContainerPresenter? { get set }
}

/// App Container View Behavior

protocol AppContainerViewBehavior: ViewBehavior {
    func setBackgroundColor(_ color: UIColor)
}

/// App Container View Controller

class AppContainerViewController: UIViewController, AppContainerViewViper, AppContainerViewBehavior{

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
