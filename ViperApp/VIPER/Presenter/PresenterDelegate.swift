// PresenterDelegate.swift

import Foundation

/// Presenter Delegate

protocol PresenterDelegate {
    // Managing the View
    func loadView()
    func viewDidLoad()
    
    // Responding to View Events
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
    
    // Configuring the View's Layout Behavior
    func viewWillLayoutSubviews()
    func viewDidLayoutSubviews()
    func updateViewConstraints()
}
