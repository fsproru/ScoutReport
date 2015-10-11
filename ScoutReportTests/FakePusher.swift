import UIKit
@testable import ScoutReport

class FakePusher: PusherType {
    var navigationController: UINavigationController?
    var pushedViewController: UIViewController?
    var animated:             Bool?

    func pushViewController(navigationController navigationController: UINavigationController, viewControllerToPush: UIViewController, animated: Bool) {
        self.navigationController = navigationController
        self.animated             = animated
        pushedViewController      = viewControllerToPush
    }
}