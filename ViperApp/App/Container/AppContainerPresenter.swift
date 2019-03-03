// AppContainerPresenter.swift

/// Presenter

protocol AppContainerPresenter: Presenter {
    var viewDelegate: AppContainerPresenterViewDelegate { get }
}

/// Presenter Impl

struct AppContainerPresenterImpl: AppContainerPresenter {
    let behavior: AppContainerViewBehavior
    var viewDelegate: AppContainerPresenterViewDelegate
    
    init(_ viewBehavior: AppContainerViewBehavior) {
        behavior = viewBehavior
        viewDelegate = AppContainerPresenterViewDelegateImpl(viewBehavior)
    }

}
