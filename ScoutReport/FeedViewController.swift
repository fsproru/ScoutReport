import UIKit

class FeedViewController: UIViewController {
    var instagramClient: InstagramClientType = InstagramClient()
    var presenter:       PresenterType       = Presenter()

    override func viewDidLoad() {
        authenticateWithInstagramIfNeeded()
        fetchContentIfNeeded()
    }

    private func authenticateWithInstagramIfNeeded() {
        if Suspect.chosenSuspect?.instagramAccessToken == nil {
            let instagramAuthViewController = UIStoryboard.loadViewController(storyboardName: "Feed", identifier: "instagramAuthViewController") as! InstagramAuthViewController
            presenter.present(underlyingViewController: self, viewControllerToPresent: instagramAuthViewController, animated: true, completion: nil)
        }
    }

    private func fetchContentIfNeeded() {
        if let instagramUsername = Suspect.chosenSuspect?.instagramUsername {
            instagramClient.getContent(username: instagramUsername,
                success: { instagramMedias in
                },
                failure: { error in
                }
            )
        }
    }
}