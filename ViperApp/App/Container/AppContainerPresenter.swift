// AppContainerPresenter.swift

/// Presenter

protocol AppContainerPresenter: Presenter {
    var viewDelegate: AppContainerPresenterViewDelegate { get }
    var viewTableDataSource: AppContainerPresenterViewTableDataSource { get }
    var viewTableDelegate: AppContainerPresenterViewTableDelegate { get }
}

/// Presenter Impl

struct AppContainerPresenterImpl: AppContainerPresenter {
    let behavior: AppContainerViewBehavior
    var viewDelegate: AppContainerPresenterViewDelegate
    var viewTableDataSource: AppContainerPresenterViewTableDataSource
    var viewTableDelegate: AppContainerPresenterViewTableDelegate
    
    private let interactor: AppContainerInteractor = AppContainerInteractorImpl()

    init(_ viewBehavior: AppContainerViewBehavior) {
        behavior = viewBehavior
        viewDelegate = AppContainerPresenterViewDelegateImpl(viewBehavior)
        
        viewTableDataSource = AppContainerPresenterViewTableDataSourceImpl()
        viewTableDataSource.interactor = interactor

        viewTableDelegate = AppContainerPresenterViewTableDelegateImpl()
        viewTableDelegate.interactor = interactor
    }
}
