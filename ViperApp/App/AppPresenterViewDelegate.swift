// AppPresenterViewDelegate.swift

// Presenter View Delegate

protocol AppPresenterViewDelegate: ViewDelegate { }

// Presenter View Delegate Impl

struct AppPresenterViewDelegateImpl: AppPresenterViewDelegate {
    
    // MARK: - Vars
    
    private let behavior: AppViewBehavior
    
    init(_ viewBehavior: AppViewBehavior) {
        behavior = viewBehavior
    }
    
    /// MARK: - Public
    
    // Managing the View
    func loadView() {
        
    }
    func viewDidLoad() {
        behavior.updateLabelTitle("VIPER App")
        behavior.updateButtonTitle("Hello")
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
