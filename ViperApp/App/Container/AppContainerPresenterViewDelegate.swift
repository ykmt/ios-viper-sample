// AppContainerPresenterViewDelegate.swift

/// Presenter View Delegate

protocol AppContainerPresenterViewDelegate: ViewDelegate { }

/// Presenter View Delegate Impl

struct AppContainerPresenterViewDelegateImpl: AppContainerPresenterViewDelegate {
    
    // MARK: - Vars
    
    private let behavior: AppContainerViewBehavior
    
    init(_ viewBehavior: AppContainerViewBehavior) {
        behavior = viewBehavior
    }
    
    /// MARK: - Public
    
    // Managing the View
    func loadView() {
        
    }
    func viewDidLoad() {
        behavior.setBackgroundColor(.red)
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
