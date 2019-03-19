// AppPresenterViewAction.swift

/// Presenter View Action

protocol AppPresenterViewAction: AppViewAction {
    var presenter: AppPresenter? { get set }
    var interactor: AppInteractor? { get set }
}

/// Presenter View Action Impl

struct AppPresenterViewActionImpl: AppPresenterViewAction {
    
    var presenter: AppPresenter?
    var interactor: AppInteractor?
    
    // MARK: - App Presenter View Action
    
    func handleButtonAction() {
        guard let view = presenter as? AppPresenterInterface else {
            return
        }
        Router.App.presentGreetingView(from: view)
    }
    
}
