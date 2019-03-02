// GreetingRouter.swift

/// Greeting Router

protocol GreetingRouter { }

/// Greeting Wireframe

protocol GreetingWireframe: GreetingRouter {
    func closeGreetingView(from presenter: GreetingPresenterInterface)
}

/// Greeting Router Impl

struct GreetingRouterImpl: GreetingWireframe {

    func closeGreetingView(from presenter: GreetingPresenterInterface) {
        if presenter.shouldClose {
            Router.App.closeGreetingView(completion: {
                presenter.didClose()
            })
        }
    }

}
