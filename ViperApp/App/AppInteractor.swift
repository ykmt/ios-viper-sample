// AppInteractor.swift

/// Interactor

protocol AppInteractor: Interactor {
    var alreadyGreeting: Bool { get }
    func didGreeting() -> Person
}

/// Interactor Impl

class AppInteractorImpl: AppInteractor {

    var greeting: Greeting = Greeting()
    var entity: PersonEntity?
    var alreadyGreeting: Bool {
        return greeting.isGreeting
    }

    func didGreeting() -> Person {
        greeting.isGreeting = true
        
        entity = PersonEntity(firstName: "yk", lastName: "mt", age: 45)
        return entity! as Person
    }
}
