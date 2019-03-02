// AppViewController.swift

import UIKit

/// App View Viper

protocol AppViewViper {
    var presenter: AppPresenter? { get set }
}

/// App View Behavior

protocol AppViewBehavior: ViewBehavior {
    func updateLabelTitle(_ text: String)
    func updateButtonTitle(_ text: String)
}

/// App View Action

protocol AppViewAction: ViewAction {
    func greetingButtonAction()
}

/// App View Controller

class AppViewController: UIViewController, AppViewViper, AppViewBehavior {

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
        presenter?.viewAction.greetingButtonAction()
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
