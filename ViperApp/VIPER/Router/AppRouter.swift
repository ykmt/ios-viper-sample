// AppRouter.swift

import UIKit

/// App Wireframe
///
/// `Router`プロトコルです。 `GreetingWireframe`の実装クラスを変数に持ちます。

protocol AppRouter {
    var Greeting: GreetingWireframe { get set }
}

/// App Wireframe
///
/// `Wireframe`プロトコルです。
///
/// `AppView`に関する画面遷移を担当し、`View`の参照を保持し、`Presenter`オブジェクトを生成し`View`に設定します。

protocol AppWireframe: AppRouter {
    var View: AppViewController? { get set }
    func setup(_ window: UIWindow)
    func prepareAppContainerView(_ view: AppContainerViewController)
    func presentGreetingView(from presenter: AppPresenterInterface)
    func closeGreetingView(completion: (() -> Void)?)
}

/// App Wireframe Impl
///
/// `AppWireframe`プロトコルを実装します。
///
/// `Wireframe`は `UIKit`をimportできるので、UIWindow, UIViewControllerなどを扱うことができます。

struct AppWireframeImpl: AppWireframe {

    var Greeting: GreetingWireframe = GreetingWireframeImpl()
    var View: AppViewController?

    func setup(_ window: UIWindow) {
        guard let appVC = window.rootViewController as? AppViewController else {
            return
        }
        Router.App.View = appVC
        appVC.presenter = AppPresenterImpl(appVC)
    }
    
    func prepareAppContainerView(_ view: AppContainerViewController) {
        view.presenter = AppContainerPresenterImpl(view)
    }
    
    func presentGreetingView(from presenter: AppPresenterInterface) {
        if presenter.shouldShowGreetingView {
            Greeting.presentGreetingView(from: self, completion: {
                presenter.didShowGreetingView()
            })
        }
    }

    func closeGreetingView(completion: (() -> Void)?) {
        View?.dismiss(animated: true, completion: completion)
    }
    
}
