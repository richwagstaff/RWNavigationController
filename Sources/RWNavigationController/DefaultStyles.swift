
import UIKit

/// Styles for a translucent navigation bar.
public final class TranslucentBar: RWNavigationBarCustomStyle {
    
    public final var key: String = "_translucent"
    
    /// Makes the navigation bar translucent
    public final func configure(_ navigationBar: UINavigationBar) {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = nil
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = nil
    }
    
}

/// Styles for a transparent navigation bar.
public final class TransparentBar: RWNavigationBarCustomStyle {
    
    public final var key: String = "_transparent"
    
    /// Makes the navigation bar translucent
    public final func configure(_ navigationBar: UINavigationBar) {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = .clear
    }
    
}

/// Styles for the special "Continous" navigation bar.
public final class ContinuousBar: RWNavigationBarCustomStyle {
    
    public final var key: String = "_continuous"
    
    public final func configure(_ navigationBar: UINavigationBar) {
        // Nothing - handled by RWNavigationController
    }
    
}
