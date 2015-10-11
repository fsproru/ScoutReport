import UIKit

class ChooseInstagramViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var instagramUsernameField: UITextField!
    @IBOutlet var instagramLabel: UILabel!
    var pusher: PusherType = Pusher()

    override func viewDidLoad() {
        instagramLabel.font         = Config.standardHeaderFont
        instagramUsernameField.font = Config.standardBodyFont
        view.backgroundColor        = Config.instagramBackgroundColor
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        pushNextViewController()
        return true
    }

    private func pushNextViewController() {
        if let navigationController = navigationController {
            let nextViewController = UIStoryboard.loadViewController(storyboardName: "ChooseSuspect", identifier: "chooseYoutubeViewController") as! ChooseYoutubeViewController
            nextViewController.chosenInstagramUsername = instagramUsernameField.text
            pusher.pushViewController(navigationController: navigationController, viewControllerToPush: nextViewController)
        }
    }
}