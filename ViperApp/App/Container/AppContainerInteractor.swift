// AppContainerInteractor.swift

import Foundation

/// Interactor

protocol AppContainerInteractor: Interactor {
    var allCellData: [AppContainerCellDataEntity]? { get }

    func loadAllCellData()
}

/// Interactor Impl

class AppContainerInteractorImpl: AppContainerInteractor {
    var allCellData: [AppContainerCellDataEntity]?
    
    func loadAllCellData() {
        allCellData = []
        allCellData?.append(AppContainerCellDataEntity(title: "0123456789\n0123456789\n0123456789\n0123456789\n0123456789\n"))
        allCellData?.append(AppContainerCellDataEntity(title: "abcdefghij\nabcdefghij\nabcdefghij\nabcdefghij\nabcdefghij\n"))
        allCellData?.append(AppContainerCellDataEntity(title: "0123456789\n0123456789\n0123456789\n0123456789\n0123456789\n"))
        allCellData?.append(AppContainerCellDataEntity(title: "abcdefghij\nabcdefghij\nabcdefghij\nabcdefghij\nabcdefghij\n"))
        allCellData?.append(AppContainerCellDataEntity(title: "0123456789\n0123456789\n0123456789\n0123456789\n0123456789\n"))
        allCellData?.append(AppContainerCellDataEntity(title: "0123456789\n0123456789\n0123456789\n0123456789\n0123456789\n"))
        allCellData?.append(AppContainerCellDataEntity(title: "abcdefghij\nabcdefghij\nabcdefghij\nabcdefghij\nabcdefghij\n"))
    }
}
