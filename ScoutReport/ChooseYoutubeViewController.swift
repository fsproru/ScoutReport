import UIKit

class ChooseYoutubeViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var youtubeLabel: UILabel!
    @IBOutlet var youtubeUsernameField: UITextField!
    var chosenInstagramUsername: String?

    override func viewDidLoad() {
        youtubeLabel.font             = Config.standardHeaderFont
        youtubeUsernameField.font     = Config.standardBodyFont
        view.backgroundColor          = Config.youtubeBackgroundColor
        youtubeUsernameField.delegate = self
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let chosenInstagramUsername = chosenInstagramUsername, chosenYoutubeUsername = youtubeUsernameField.text {
            let chosenSuspect = Suspect(instagramUsername: chosenInstagramUsername, youtubeUsername: chosenYoutubeUsername)
            Suspect.chosenSuspect = chosenSuspect
            return true
        } else {
            return false
        }
    }
}