import UIKit


public protocol RWNavigationBarCustomStyle {
    var key: String { get set }
    func configure(_ navigationBar: UINavigationBar)
}
