import UIKit

class FeedViewController: UIViewController {
    var instagramClient: InstagramClientType = InstagramClient()
    var presenter:        PresenterType       = Presenter()

    override func viewDidLoad() {
        if let instagramUsername = Suspect.chosenSuspect?.instagramUsername {
            authenticateWithInstagram()
            fetchContent(instagramUsername: instagramUsername)
        }
    }

    private func authenticateWithInstagram() {
        let instagramAuthViewController = UIStoryboard.loadViewController(storyboardName: "Feed", identifier: "instagramAuthViewController") as! InstagramAuthViewController
        presenter.present(underlyingViewController: self, viewControllerToPresent: instagramAuthViewController, animated: true, completion: nil)
    }

    private func fetchContent(instagramUsername instagramUsername: String) {
        instagramClient.getContent(username: instagramUsername,
            success: { instagramMedias in
            },
            failure: { error in
            }
        )
    }
}