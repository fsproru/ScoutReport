import XCTest
import UIKit

extension XCTestCase {
    func setupNavigationControllerViewStack(viewController viewController: UIViewController) {
        let window                = UIWindow()
        let navigationController  = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}