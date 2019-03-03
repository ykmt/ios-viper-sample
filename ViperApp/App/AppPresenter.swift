// AppPresenter.swift

/// Presenter

protocol AppPresenter: Presenter {
    var viewDelegate: AppPresenterViewDelegate { get }
    var viewAction: AppPresenterViewAction { get }
}

/// Presenter Interface

protocol AppPresenterInterface: PresenterInterface {
    var shouldShowGreetingView: Bool { get }
    func didShowGreetingView()
}

/// Presenter Impl

struct AppPresenterImpl: AppPresenter, AppPresenterInterface {

    // MARK: - Vars
    
    private let behavior: AppViewBehavior
    private let interactor: AppInteractor = AppInteractorImpl()
    
    var viewDelegate: AppPresenterViewDelegate
    var viewAction: AppPresenterViewAction = AppPresenterViewActionImpl()
    var shouldShowGreetingView: Bool {
        return !interactor.alreadyGreeting
    }
    
    init(_ viewBehavior: AppViewBehavior) {
        behavior = viewBehavior
        viewDelegate = AppPresenterViewDelegateImpl(viewBehavior)
        viewAction.presenter = self
        viewAction.interactor = interactor
    }

    // MARK: - App Presenter Interface
    
    func didShowGreetingView() {
        let person = interactor.didGreeting()
        behavior.updateButtonTitle("See you " + person.firstName + ".")
    }
    
}
