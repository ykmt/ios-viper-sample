import Foundation
import UIKit

protocol ViewTableDelegate {
    func didSelectRowAt(_ indexPath: IndexPath)
    func heightForRowAt(_ indexPath: IndexPath) -> CGFloat
    // ... 追加してしてください ... //
}

extension ViewTableDelegate {
    func didSelectRowAt(_ indexPath: IndexPath) {
        
    }    
    func heightForRowAt(_ indexPath: IndexPath) -> CGFloat {
        return 0.0
    }
    // ... 追加してしてください ... //
}
