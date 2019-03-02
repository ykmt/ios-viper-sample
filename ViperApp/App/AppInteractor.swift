// AppInteractor.swift

/// App Interactor

protocol AppInteractor: Interactor {
    var alreadyGreeting: Bool { get }
    func didGreeting()
}

/// App Interactor Impl

class AppInteractorImpl: AppInteractor {

    var greeting: Greeting = Greeting()
    
    var alreadyGreeting: Bool {
        return greeting.isGreeting
    }

    func didGreeting() {
        greeting.isGreeting = true
    }
}
