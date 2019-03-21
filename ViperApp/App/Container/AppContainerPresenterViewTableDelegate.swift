// AppContainerPresenterViewTableDelegate.swift

import Foundation

/// Presenter View Table Delegate

protocol AppContainerPresenterViewTableDelegate: ViewTableDelegate {
    var interactor: AppContainerInteractor? { get set }
}

/// Presenter View Table Delegate Impl

struct AppContainerPresenterViewTableDelegateImpl: AppContainerPresenterViewTableDelegate {
    
    var interactor: AppContainerInteractor?

    func didSelectRowAt(_ indexPath: IndexPath) {
        guard let allCellData = interactor?.allCellData else {
            return
        }
        let detail = allCellData[indexPath.row].detail()
        debugPrint(detail.description)
    }
}
