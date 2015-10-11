import UIKit

protocol DismisserType {
    func dismiss(viewController viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
}

class Dismisser: DismisserType {
    func dismiss(viewController viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        viewController.dismissViewControllerAnimated(animated, completion: completion)
    }
}