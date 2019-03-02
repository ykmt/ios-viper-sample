// GreetingViewController.swift

import UIKit

/// Greeting View Viper

protocol GreetingViewViper {
    var presenter: GreetingPresenter? { get set }
}

/// Greeting View Behavior

protocol GreetingViewBehavior: ViewBehavior {
    func updateHiButtonTitle(_ text: String)
    func updateHiButtonEnable(_ isEnabled: Bool)
    func updateCloseButtonTitle(_ text: String)
    func updateCloseButtonEnable(_ isEnabled: Bool)
}

/// Greeting View Action

protocol GreetingViewAction: ViewAction {
    func hiButtonAction()
    func closeButtonAction()
}

/// Greeting View Controller

class GreetingViewController: UIViewController, GreetingViewViper, GreetingViewBehavior {

    @IBOutlet weak var closeButton: UIBarButtonItem!
    @IBOutlet weak var hiButton: UIButton!
    
    var presenter: GreetingPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDelegate.viewDidLoad()
    }
    
    @IBAction func handleCloseButtonAction(_ sender: Any) {
        presenter?.viewAction.closeButtonAction()
    }
    
    @IBAction func handleHiButtonAction(_ sender: Any) {
        presenter?.viewAction.hiButtonAction()
    }
    
    // MARK: - Behavior
    
    func updateHiButtonTitle(_ text: String) {
        hiButton.setTitle(text, for: .normal)
    }
    
    func updateHiButtonEnable(_ isEnabled: Bool) {
        hiButton.isEnabled = isEnabled
    }
    
    func updateCloseButtonTitle(_ text: String) {
        closeButton.title = text
    }
    
    func updateCloseButtonEnable(_ isEnabled: Bool) {
        closeButton.isEnabled = isEnabled
    }
    
}
