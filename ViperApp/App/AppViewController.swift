// AppViewController.swift

import UIKit

/// Viper

protocol AppViper {
    var presenter: AppPresenter? { get set }
}

/// View Behavior

protocol AppViewBehavior: ViewBehavior {
    func updateLabelTitle(_ text: String)
    func updateButtonTitle(_ text: String)
}

/// View Action

protocol AppViewAction: ViewAction {
    func handleButtonAction()
}

/// View Controller

class AppViewController: UIViewController, AppViper, AppViewBehavior {

    let EmbedSegueToContainerView = "AppContainerViewControllerSegue"

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var presenter: AppPresenter?
    private var containerPresenter: AppContainerPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDelegate.viewDidLoad()
    }
    
    @IBAction func handleButtonAction(_ sender: Any) {
        presenter?.viewAction.handleButtonAction()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == EmbedSegueToContainerView {
            guard let containerVC = segue.destination as? AppContainerViewController else {
                return
            }
            Router.App.prepareAppContainerView(containerVC)
            containerPresenter = containerVC.presenter
        }
    }

    // MARK: - App View Behavior
    
    func updateLabelTitle(_ text: String) {
        label.text = text
    }
    
    func updateButtonTitle(_ text: String) {
        button.setTitle(text, for: .normal)
    }
}
