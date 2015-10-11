import UIKit

class MainViewController: UIViewController {
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var appNameLabel: UILabel!
    var presenter: PresenterType = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        appNameLabel.text = Config.appNameText
        appNameLabel.font = Config.standardHeaderFont
    }

    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let chooseSuspectNavigationController = UIStoryboard.loadViewController(storyboardName: "ChooseSuspect", identifier: "chooseSuspectNavigationController") as! UINavigationController
        if Suspect.chosenSuspect == nil {
            presenter.present(underlyingViewController: self, viewControllerToPresent: chooseSuspectNavigationController, animated: true, completion: nil)
        }
    }
}