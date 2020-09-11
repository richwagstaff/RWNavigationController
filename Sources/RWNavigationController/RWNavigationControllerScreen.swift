
public protocol RWNavigationControllerScreen: class {
    var navigationBarStyle: RWNavigationBarStyle { get }
}

public protocol RWCustomNavigationControllerScreen: class {
    var customNavigationBarConfig: RWNavigationBarCustomStyle { get }
}

