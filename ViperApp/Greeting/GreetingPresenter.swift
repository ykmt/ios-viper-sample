// GreetingPresenter.swift

/// Greeing Presenter

protocol GreetingPresenter: Presenter {
    var viewDelegate: GreetingPresenterViewDelegate { get }
    var viewAction: GreetingPresenterViewAction { get }

    func sayHi()
}

/// Greeting Presentation Interface

protocol GreetingPresenterInterface: PresenterInterface {
    var shouldClose: Bool { get }
    
    func didClose()
}

/// Greeting Presenter Impl

struct GreetingPresenterImpl: GreetingPresenter, GreetingPresenterInterface {

    private let behavior: GreetingViewBehavior?
    var interactor: GreetingInteractor = GreetingInteractorImpl()

    var viewDelegate: GreetingPresenterViewDelegate
    var viewAction: GreetingPresenterViewAction = GreetingPresenterViewActionImpl()
    
    var shouldClose: Bool {
        return interactor.isSayHi
    }

    init(_ viewBehavior: GreetingViewBehavior) {
        behavior = viewBehavior
        viewDelegate = GreetingPresenterViewDelegateImpl(viewBehavior)
        viewAction.behavior = behavior
        viewAction.presenter = self
        viewAction.interactor = interactor
    }
    
    // MARK: - Greeting Presenter
    
    func sayHi() {
        interactor.sayHi()
    }
    
    // MARK: Greeting Presenter Interface
    
    func didClose() {
        print("Greeting View did close.")
    }
}
