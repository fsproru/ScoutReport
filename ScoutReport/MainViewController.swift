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
        chooseWhereToGo()
    }

    private func chooseWhereToGo() {
        if Suspect.chosenSuspect == nil {
            let chooseSuspectNavigationController = UIStoryboard.loadViewController(storyboardName: "ChooseSuspect", identifier: "chooseSuspectNavigationController") as! UINavigationController

            presenter.present(underlyingViewController: self, viewControllerToPresent: chooseSuspectNavigationController, animated: true, completion: nil)
        } else {
            let feedViewController = UIStoryboard.loadViewController(storyboardName: "Feed", identifier: "feedNavigationController") as! UINavigationController
            presenter.present(underlyingViewController: self, viewControllerToPresent: feedViewController, animated: true, completion: nil)
        }
    }
}