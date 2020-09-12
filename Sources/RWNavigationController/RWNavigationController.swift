
import UIKit


open class RWNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    /// Whether the navigation bar is currently transparent or not.
    public var stylesController = RWNavigationBarStyleController(source: nil)
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        stylesController.source = self
    }
    
    
    /// Sets the bar style.
    /// - Parameter style: The bar style.
    public func setNavigationBarStyle(_ style: RWNavigationBarStyle) {
        stylesController.setNavigationBarStyle(style)
    }
    
    
    /// Sets the bar config.
    /// - Parameter config: The custom navigation bar configuration.
    public func setNavigationBarConfig(_ config: RWNavigationBarCustomStyle) {
        stylesController.setNavigationBarConfig(config)
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
        stylesController.navigationController(navigationController, willShow: viewController, animated: animated)
    }
    

}


extension RWNavigationController: RWNavigationBarStyleControllerSource {
    
    /// The navigation controller for the styles
    public func navigationController(_ stylesController: RWNavigationBarStyleController) -> UINavigationController? {
        return self
    }
    
}
