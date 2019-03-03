// GreetingPresenterViewDelegate.swift

/// Presenter View Delegate

protocol GreetingPresenterViewDelegate: ViewDelegate { }

/// Presenter View Delegate Impl

struct GreetingPresenterViewDelegateImpl: GreetingPresenterViewDelegate {
    
    // MARK: - Vars
    
    private let behavior: GreetingViewBehavior
    
    init(_ viewBehavior: GreetingViewBehavior) {
        behavior = viewBehavior
    }
    
    /// MARK: - Public
    
    // Managing the View
    func loadView() {
        
    }
    func viewDidLoad() {
        behavior.updateHiButtonTitle("Hi")
        behavior.updateHiButtonEnable(true)
        behavior.updateCloseButtonTitle("Close")
        behavior.updateCloseButtonEnable(false)
    }
    
    // Responding to View Events
    func viewWillAppear(_ animated: Bool) {
        
    }
    func viewDidAppear(_ animated: Bool) {
        
    }
    func viewWillDisappear(_ animated: Bool) {
        
    }
    func viewDidDisappear(_ animated: Bool) {
        
    }
    
    // Configuring the View's Layout Behavior
    func viewWillLayoutSubviews() {
        
    }
    func viewDidLayoutSubviews() {
        
    }
    func updateViewConstraints() {
        
    }
}
