

import UIKit

public protocol RWNavigationBarStyleControllerSource: class {
    func navigationController(_ stylesController: RWNavigationBarStyleController) -> UINavigationController?
}

public class RWNavigationBarStyleController {
    
    weak public var source: RWNavigationBarStyleControllerSource?
    
    /// Convenient way to get the navigation controller
    var navigationController: UINavigationController? {
        return source?.navigationController(self)
    }
    
    /// Important: Set UINavigationControllerDelegate and ensure that navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) is called in this class from the delegate function.
    public init(
        source: RWNavigationBarStyleControllerSource?
    ) {
        self.source = source
    }
    
    /// Whether the navigation bar is currently transparent or not.
    public var currentBarStyle: String = ""
    
    
    /// A convenient way to get the key
    private let continuousBarKey = ContinuousBar().key
     
    
    /// Sets the bar style.
    /// - Parameter style: The bar style.
    public func setNavigationBarStyle(_ style: RWNavigationBarStyle) {
        setNavigationBarConfig(style.config())
    }
    
    
    /// Sets the bar config.
    /// - Parameter config: The custom navigation bar configuration.
    public func setNavigationBarConfig(_ config: RWNavigationBarCustomStyle) {
        updateNavigationBarStyle(config, forwards: true)
    }
    
    
    /// Handles updating the navigation bar with the style. If the style is already being used, then the bar isn't updated.
    /// - Parameters:
    ///   - config: The navigation bar configuration.
    ///   - forwards: True if the view controller is being pushed, false if the view controller is being been popped. If in doubt, use true as pops are already detected by RWNavigationController.
    private func updateNavigationBarStyle(_ config: RWNavigationBarCustomStyle, forwards: Bool) {
        if config.key == continuousBarKey {
            handleContinuousStyle(forwards: forwards)
            return
        }
        
        guard currentBarStyle != config.key, let navigationController = self.navigationController else { return }
        
        currentBarStyle = config.key
        config.configure(navigationController.navigationBar)
    }
    
    
    
    /// Handles the special continuous style.
    /// - Parameter forwards: If forwards is true, then it navigation controller adopts the current configuration. If false, the last screen that pushed a view controller before this one that has a non continuous configuration is used.
    private func handleContinuousStyle(forwards: Bool) {
        // If forwards then there is nothing to do - the current style is kept.
        if forwards { return }
        
        // Going backwards, so find the last used state that wasn't continuous.
        let viewControllers: [UIViewController] = navigationController?.viewControllers ?? []
        for vc in viewControllers.reversed() {
            
            // Loop through view controllers and use the style of the first one that is not continuous.
            if let config = vc.RWNavBarConfig, config.key != continuousBarKey {
                updateNavigationBarStyle(config, forwards: true)
                break
            }
            
        }
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
        
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        var forwards: Bool
        if navigationController.viewControllers.contains(fromViewController) {
            // Check whether our view controller array already contains that view controller.
            // If it does it means we’re pushing a different view controller on top rather than popping it.
            forwards = true
        }
        else {
            // We’re popping the view controller
            forwards = false
        }
        
        if let config = viewController.RWNavBarConfig {
            updateNavigationBarStyle(config, forwards: forwards)
        }
        
        
    }
    

}


fileprivate extension UIViewController {
    
    /// A quick and convenient way to get the config from the view controller
    var RWNavBarConfig: RWNavigationBarCustomStyle? {
        if let screen = self as? RWNavigationControllerScreen {
            return screen.navigationBarStyle.config()
        }
        else if let screen = self as? RWCustomNavigationControllerScreen {
            return screen.customNavigationBarConfig
        }
        else {
            return nil
        }
    }
    
    
    
}

