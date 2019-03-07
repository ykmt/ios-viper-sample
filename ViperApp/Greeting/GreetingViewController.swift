// GreetingViewController.swift

import UIKit

/// Viper

protocol GreetingViper {
    var presenter: GreetingPresenter? { get set }
}

/// View Behavior

protocol GreetingViewBehavior: ViewBehavior {
    func updateHiButtonTitle(_ text: String)
    func updateHiButtonEnable(_ isEnabled: Bool)
    func updateCloseButtonTitle(_ text: String)
    func updateCloseButtonEnable(_ isEnabled: Bool)
}

/// View Action

protocol GreetingViewAction: ViewAction {
    func hiButtonAction()
    func closeButtonAction()
}

/// View

class GreetingViewController: UIViewController, GreetingViper, GreetingViewBehavior {

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
