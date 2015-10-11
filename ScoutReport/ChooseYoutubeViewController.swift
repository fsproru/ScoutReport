import UIKit

class ChooseYoutubeViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var youtubeLabel: UILabel!
    @IBOutlet var youtubeUsernameField: UITextField!
    @IBOutlet var youtubeLogoImageView: UIImageView!
    var chosenInstagramUsername: String?
    var dismisser: DismisserType = Dismisser()

    override func viewDidLoad() {
        youtubeLogoImageView.image    = Config.youtubeLogoImage
        youtubeLabel.font             = Config.standardHeaderFont
        youtubeLabel.text             = Config.chooseYoutubeText
        youtubeUsernameField.font     = Config.standardBodyFont
        view.backgroundColor          = Config.youtubeBackgroundColor
        youtubeUsernameField.delegate = self
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let chosenInstagramUsername = chosenInstagramUsername, chosenYoutubeUsername = youtubeUsernameField.text {
            let chosenSuspect = Suspect(instagramUsername: chosenInstagramUsername, youtubeUsername: chosenYoutubeUsername)
            Suspect.chosenSuspect = chosenSuspect
            dismisser.dismiss(viewController: self, animated: true, completion: nil)
            return true
        } else {
            return false
        }
    }
}