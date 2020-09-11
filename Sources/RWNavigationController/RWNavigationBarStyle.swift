
import Foundation

public enum RWNavigationBarStyle {
    case transparent
    case translucent
    case continuous
    
    func config() -> RWNavigationBarCustomStyle {
        switch self {
        case .continuous:
            return ContinuousBar()
        case .transparent:
            return TransparentBar()
        case .translucent:
            return TranslucentBar()
        }
    }
}
