import UIKit
@testable import ScoutReport

class FakePusher: PusherType {
    var navigationController: UINavigationController?
    var pushedViewController: UIViewController?

    func pushViewController(navigationController navigationController: UINavigationController, viewControllerToPush: UIViewController) {
        self.navigationController = navigationController
        pushedViewController      = viewControllerToPush
    }
}