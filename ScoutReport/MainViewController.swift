import UIKit

class MainViewController: UIViewController {
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var appNameLabel: UILabel!

    override func viewDidLoad() {
        appNameLabel.text = Config.appNameText
        appNameLabel.font = Config.standardHeaderFont
    }
}