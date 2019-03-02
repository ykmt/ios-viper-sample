// AppContainerPresenter.swift

/// App Container Presenter

protocol AppContainerPresenter: Presenter {
    var viewDelegate: AppContainerPresenterViewDelegate { get }
}

/// App Container Presenter Impl

struct AppContainerPresenterImpl: AppContainerPresenter {
    let behavior: AppContainerViewBehavior
    var viewDelegate: AppContainerPresenterViewDelegate
    
    init(_ viewBehavior: AppContainerViewBehavior) {
        behavior = viewBehavior
        viewDelegate = AppContainerPresenterViewDelegateImpl(viewBehavior)
    }

}
