# RWNavigationController

A quick and easy way to change the navigation bar styles when navigating between view controllers.


**Instructions**

Option 1

Set your navigation controller style as RWNavigationBarController

Option 2

In your own UINavigationController subclass, add the following:

```swift
var navigationBarStyles = RWNavigationBarStyleController(source: nil)

override func viewDidLoad() {
    super.viewDidLoad()

    // Set navigation bar delegate and styles source
    delegate = self
    navigationBarStyles.source = self
}

/// Sets the navigation bar style.
/// - Parameter style: The navigation bar style.
func setNavigationBarStyle(_ style: RWNavigationBarStyle) {
    // A convenient function to have to make setting the style easy.
    navigationBarStyles.setNavigationBarStyle(style)
}


/// Called by the navigation controller delegate when a new view controller will show.
/// - Parameters:
///   - navigationController: The navigation controller.
///   - viewController: The view controller to show.
///   - animated: Animated.
func navigationController(
    _ navigationController: UINavigationController,
    willShow viewController: UIViewController,
    animated: Bool
) {
    // The UINavigationController delegate fires this and we must tell the styles controller that it has fired.
    navigationBarStyles.navigationController(navigationController, willShow: viewController, animated: animated)
}
```


The are three default styles:
- Translucent
- Transparent
- Continuous

You can create your own by subclassing RWNavigationBarStyle.
```swift
class CustomBar: RWNavigationBarStyle {
    
    init() {
        super.init(key: "unique_style_key")
    }
    
    override public func configure(_ navigationBar: UINavigationBar) {
      // configure navigation bar here
    }
    
}
```

