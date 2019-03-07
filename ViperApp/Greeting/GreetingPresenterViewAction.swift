// GreetingPresenterViewAction.swift

/// Presenter View Action

protocol GreetingPresenterViewAction: GreetingViewAction {
    var behavior: GreetingViewBehavior? { get set }
    var presenter: GreetingPresenter? { get set }
    var interactor: GreetingInteractor? { get set }
}

/// Presenter View Action Impl

struct GreetingPresenterViewActionImpl: GreetingPresenterViewAction {
    
    var behavior: GreetingViewBehavior?
    var presenter: GreetingPresenter?
    var interactor: GreetingInteractor?
    
    func hiButtonAction() {
        guard let interactor = interactor, let behavior = behavior else { return }

        interactor.sayHi()
        behavior.updateHiButtonTitle("Bye")
        behavior.updateHiButtonEnable(false)
        behavior.updateCloseButtonEnable(true)
    }
    
    func closeButtonAction() {
        guard let presenter = presenter as? GreetingPresenterInterface,
            let interactor = interactor else {
                return
        }

        if interactor.isSayHi {
            Router.App.Greeting.closeGreetingView(from: presenter)
        }
    }
    
}
