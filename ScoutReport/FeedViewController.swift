import UIKit

class FeedViewController: UIViewController {
    var instagramClient: InstagramClientType = InstagramClient()

    override func viewDidLoad() {
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