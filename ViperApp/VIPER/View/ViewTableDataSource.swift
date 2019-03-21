// ViewTableDataSource.swift

import Foundation

protocol ViewTableDataSource {
    func loadData()
    
    func cellDataForRowAt(_ indexPath: IndexPath) -> Any?
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
    
    func titleForHeaderInSection(_ section: Int) -> String?
    func titleForFooterInSection(_ section: Int) -> String?
    // ... 追加してしてください ... //
}

extension ViewTableDataSource {
    func titleForHeaderInSection(_ section: Int) -> String? { return nil }
    func titleForFooterInSection(_ section: Int) -> String? { return nil }
    // ... 追加してしてください ... //
}
