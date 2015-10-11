import UIKit

protocol PusherType {
    func pushViewController(navigationController navigationController: UINavigationController, viewControllerToPush: UIViewController, animated: Bool)
}

class Pusher: PusherType {
    func pushViewController(navigationController navigationController: UINavigationController, viewControllerToPush: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewControllerToPush, animated: animated)
    }
}