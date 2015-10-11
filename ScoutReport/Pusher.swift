import UIKit

protocol PusherType {
    func pushViewController(navigationController navigationController: UINavigationController, viewControllerToPush: UIViewController)
}

class Pusher: PusherType {
    func pushViewController(navigationController navigationController: UINavigationController, viewControllerToPush: UIViewController) {
        navigationController.pushViewController(viewControllerToPush, animated: true)
    }
}