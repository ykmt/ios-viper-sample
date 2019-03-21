import UIKit

struct CellDetailData {
    var description: String
    var image: UIImage?
}

protocol AppContainerCellData {
    var title: String { get set }
}

struct AppContainerCellDataEntity: AppContainerCellData {
    var title: String
    
    func detail() -> CellDetailData {
        // UUID生成
        return CellDetailData(description: UUID.init().description, image: nil)
    }
}


