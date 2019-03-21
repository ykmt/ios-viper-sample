// AppContainerPresenterViewTableDataSource.swift

import UIKit

/// Presenter View Table Data Source

protocol AppContainerPresenterViewTableDataSource: ViewTableDataSource {
    var interactor: AppContainerInteractor? { get set }
}

/// Presenter View Table Data Source Impl

struct AppContainerPresenterViewTableDataSourceImpl: AppContainerPresenterViewTableDataSource {

    var interactor: AppContainerInteractor?
    
    func loadData() {
        interactor?.loadAllCellData()
    }
    
    func cellDataForRowAt(_ indexPath: IndexPath) -> Any? {
        return interactor?.allCellData?[indexPath.row] ?? nil
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return interactor?.allCellData?.count ?? 0
    }

}
