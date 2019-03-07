//  GreetingInteractor.swift

/// Interactor

protocol GreetingInteractor: Interactor {
    var isSayHi: Bool { get }
    
    func sayHi()
}

/// Interactor Impl

class GreetingInteractorImpl: GreetingInteractor {

    private var isHi: Bool = false
    
    var isSayHi: Bool {
        return isHi
    }

    func sayHi() {
        isHi = true
    }
    
}
