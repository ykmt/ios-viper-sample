// AppRouter.swift

import UIKit

/// App Wireframe

protocol AppRouter {
    var Greeting: GreetingWireframe { get }
}

/// App Wireframe

protocol AppWireframe: AppRouter {
    var View: AppViewController? { get set }
    
    func setupAppView(_ window: UIWindow)
    
    func prepareAppContainerView(_ view: AppContainerViewController)
    
    func presentGreetingView(from presenter: AppPresenterInterface)
    func closeGreetingView(completion: (() -> Void)?)
}

/// App Router Impl

struct AppRouterImpl: AppWireframe {

    var Greeting: GreetingWireframe {
        return GreetingRouterImpl()
    }
    
    var View: AppViewController?

    func setupAppView(_ window: UIWindow) {
        guard let appVC = window.rootViewController as? AppViewController else {
            return
        }
        Router.App.View = appVC
        Router.App.View?.presenter = AppPresenterImpl(appVC)
    }
    
    func prepareAppContainerView(_ view: AppContainerViewController) {
        view.presenter = AppContainerPresenterImpl(view)
    }
    
    func presentGreetingView(from presenter: AppPresenterInterface) {
        if presenter.shouldShowGreetingView {
            let sb = UIStoryboard(name: "Greeting", bundle: nil)
            guard let nc = sb.instantiateInitialViewController() as? UINavigationController,
                let greetingView = nc.viewControllers[0] as? GreetingViewController else {
                return
            }
            
            greetingView.presenter = GreetingPresenterImpl(greetingView)
            View?.present(nc, animated: true, completion: {
                presenter.didShowGreetingView()
            })
        }
    }

    func closeGreetingView(completion: (() -> Void)?) {
        View?.dismiss(animated: true, completion: completion)
    }
    
}
