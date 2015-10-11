import UIKit

extension UIStoryboard {
    class func loadViewController(storyboardName storyboardName: String, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(identifier)
    }
}