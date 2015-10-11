import UIKit

class ChooseYoutubeViewController: UIViewController {
    @IBOutlet var youtubeLabel: UILabel!
    @IBOutlet var youtubeUsernameField: UITextField!

    override func viewDidLoad() {
        youtubeLabel.font = Config.standardHeaderFont
        youtubeUsernameField.font = Config.standardBodyFont
    }
}