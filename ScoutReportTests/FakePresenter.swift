import UIKit
@testable import ScoutReport

class FakePresenter: PresenterType {
    var underlyingViewController: UIViewController?
    var presentedViewController:  UIViewController?
    var animated:                 Bool?
    var completion:               (() -> Void)?

    func present(underlyingViewController underlyingViewController: UIViewController, viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.underlyingViewController = underlyingViewController
        self.presentedViewController  = viewControllerToPresent
        self.animated                 = animated
        self.completion               = completion
    }
}