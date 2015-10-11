import UIKit

class ChooseSuspectViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var instagramUsernameField: UITextField!
    var pusher: PusherType = Pusher()

    override func viewDidLoad() {
        view.backgroundColor = Config.instagramBackgroundColor
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        pushNextViewController()
        return true
    }

    private func pushNextViewController() {
        if let navigationController = navigationController {
            let nextViewController = UIStoryboard.loadViewController(storyboardName: "ChooseSuspect", identifier: "chooseYoutubeViewController") as! ChooseYoutubeViewController
            pusher.pushViewController(navigationController: navigationController, viewControllerToPush: nextViewController)
        }
    }
}