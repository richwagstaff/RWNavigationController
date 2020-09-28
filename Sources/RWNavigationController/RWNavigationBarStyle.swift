
import UIKit

open class RWNavigationBarStyle {
    
    /// A transparent navigation bar.
    public static let transparent = TransparentBar()
    
    /// A special 'continuous' style navigation bar that adopts the previous view controllers navigation bar style.
    public static let continuous = ContinuousBar()
    
    /// A translucent navigation bar.
    public static let translucent = TranslucentBar()
    
    /// A unique key for the bar style that is used to know when to change the styles.
    public var key: String
    
    
    /// Important: Subclass RWNavigationBarStyle and overrride the configure(_ navigationBar: UINavigationBar) function to set the styles.
    /// - Parameter key: A unique key.
    public init(key: String) {
        self.key = key
    }
    
    
    /// Override this and update the navigation bar with whatever styles you want.
    /// - Parameter navigationBar: The navigation bar.
    open func configure(_ navigationBar: UINavigationBar) {
        
    }
    
}


