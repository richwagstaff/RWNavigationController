
import UIKit

/// Styles for a translucent navigation bar.
public final class TranslucentBar: RWNavigationBarStyle {
    
    init() {
        super.init(key: "_translucentBar")
    }
    
    
    /// Makes the navigation bar translucent
    override public func configure(_ navigationBar: UINavigationBar) {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = nil
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = nil
    }
    
}

/// Styles for a translucent navigation bar.
public final class ColorBar: RWNavigationBarStyle {
    public var color: UIColor
    
    public init(color: UIColor) {
        self.color = color
        super.init(key: "_color_\(UUID().uuidString)")
    }
    
    
    /// Makes the navigation bar translucent
    override public func configure(_ navigationBar: UINavigationBar) {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = nil
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = color
    }
    
}

/// Styles for a transparent navigation bar.
public final class TransparentBar: RWNavigationBarStyle {
    
    init() {
        super.init(key: "_transparentBar")
    }
    
    /// Makes the navigation bar translucent
    override public func configure(_ navigationBar: UINavigationBar) {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = .clear
    }
    
}

/// Styles for the special "Continous" navigation bar.
public final class ContinuousBar: RWNavigationBarStyle {
    
    init() {
        super.init(key: "_continuousBar")
    }
    
    override public func configure(_ navigationBar: UINavigationBar) {
        // Nothing to do
        // Adopts previous view controller navigation bar style and is handled by RWNavigationController.
    }
    
}
