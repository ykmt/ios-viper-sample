//  GreetingInteractor.swift

/// Greeting Interactor

protocol GreetingInteractor: Interactor {
    var isSayHi: Bool { get }
    
    func sayHi()
}

/// Greeting Interactor Impl

class GreetingInteractorImpl: GreetingInteractor {

    private var isHi: Bool = false
    
    var isSayHi: Bool {
        return isHi
    }

    func sayHi() {
        isHi = true
    }
    
}
