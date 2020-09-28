
import UIKit


open class RWNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    /// The navigation bar styles.
    public var navigationBarStyles = RWNavigationBarStyleController(source: nil)
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        navigationBarStyles.source = self
    }
    
    
    /// Sets the navigation bar style.
    /// - Parameter style: The navigation bar style.
    public func setNavigationBarStyle(_ style: RWNavigationBarStyle) {
        navigationBarStyles.setNavigationBarStyle(style)
    }
    
    
    /// Called by the navigation controller delegate when a new view controller will show.
    /// - Parameters:
    ///   - navigationController: The navigation controller.
    ///   - viewController: The view controller to show.
    ///   - animated: Animated.
    public func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool
    ) {
        navigationBarStyles.navigationController(navigationController, willShow: viewController, animated: animated)
    }
    

}


extension RWNavigationController: RWNavigationBarStyleControllerSource {
    
    /// The navigation controller for the styles
    public func navigationController(_ stylesController: RWNavigationBarStyleController) -> UINavigationController? {
        return self
    }
    
}
