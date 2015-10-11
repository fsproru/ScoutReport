import UIKit
@testable import ScoutReport

class FakeDismisser: DismisserType {
    var dismissedViewController: UIViewController?
    var animated:                Bool?
    var completion:              (() -> Void)?

    func dismiss(viewController viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        dismissedViewController = viewController
        self.animated           = animated
        self.completion         = completion
    }
}