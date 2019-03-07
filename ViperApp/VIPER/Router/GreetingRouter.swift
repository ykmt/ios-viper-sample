// GreetingRouter.swift

import UIKit

/// Greeting Router

protocol GreetingRouter { }

/// Greeting Wireframe
///
/// `Wireframe`プロトコルです。
///
/// `AppGreetingView`に関する画面遷移を担当し、`View`の参照を保持し、`Presenter`オブジェクトを生成し`View`に設定します。

protocol GreetingWireframe: GreetingRouter {
    var View: GreetingViewController? { get set }
    func presentGreetingView(from wireframe: AppWireframe, completion: (() -> Void)?)
    func closeGreetingView(from presenter: GreetingPresenterInterface)
}

/// Greeting Wireframe Impl
///
/// `GreetingWireframe`プロトコルを実装します。
///
/// `Wireframe`は `UIKit`をimportできるので、UIWindow, UIViewControllerなどを扱うことができます。

struct GreetingWireframeImpl: GreetingWireframe {
    
    let GreetingStoryboard = "Greeting"
    
    var View: GreetingViewController?
    
    func presentGreetingView(from wireframe: AppWireframe, completion: (() -> Void)?) {
        let sb = UIStoryboard(name: GreetingStoryboard, bundle: nil)
        guard let nc = sb.instantiateInitialViewController() as? UINavigationController,
            let greetingView = nc.viewControllers[0] as? GreetingViewController else {
                return
        }
        
        Router.App.Greeting.View = greetingView
        greetingView.presenter = GreetingPresenterImpl(greetingView)
        wireframe.View?.present(nc, animated: true, completion: completion)
    }
    
    func closeGreetingView(from presenter: GreetingPresenterInterface) {
        if presenter.shouldClose {
            Router.App.closeGreetingView(completion: {
                presenter.didClose()
            })
        }
    }

}
