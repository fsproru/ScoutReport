import UIKit

protocol PresenterType {
    func present(underlyingViewController underlyingViewController: UIViewController, viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
}

class Presenter: PresenterType {
    func present(underlyingViewController underlyingViewController: UIViewController, viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) {
        underlyingViewController.presentViewController(viewControllerToPresent, animated: animated, completion: completion)
    }
}