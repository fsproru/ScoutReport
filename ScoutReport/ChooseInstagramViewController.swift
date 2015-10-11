import UIKit

class ChooseInstagramViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var instagramUsernameField: UITextField!
    @IBOutlet var instagramLabel:         UILabel!
    @IBOutlet var instagramLogoImageView: UIImageView!
    var pusher: PusherType = Pusher()

    override func viewDidLoad() {
        instagramLogoImageView.image = Config.instagramLogoImage
        instagramLabel.font          = Config.standardHeaderFont
        instagramLabel.text          = Config.chooseInstagramText
        instagramUsernameField.font  = Config.standardBodyFont
        view.backgroundColor         = Config.instagramBackgroundColor
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        pushNextViewController()
        return true
    }

    private func pushNextViewController() {
        if let navigationController = navigationController {
            let nextViewController = UIStoryboard.loadViewController(storyboardName: "ChooseSuspect", identifier: "chooseYoutubeViewController") as! ChooseYoutubeViewController
            nextViewController.chosenInstagramUsername = instagramUsernameField.text
            pusher.pushViewController(navigationController: navigationController, viewControllerToPush: nextViewController, animated: true)
        }
    }
}