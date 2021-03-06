import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    var posts:          [InstagramPost]      = []
    var instagramClient: InstagramClientType = InstagramClient()
    var presenter:       PresenterType       = Presenter()

    override func viewDidLoad() {
        setupTableView()
        setupRefreshControl()
        authenticateWithInstagramIfNeeded()
    }

    override func viewWillAppear(animated: Bool) {
        fetchContentIfPossible()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("instagramPostCell") {
            if let imageURL = NSURL(string: posts[indexPath.row].imageURLString), imageData = NSData(contentsOfURL: imageURL) {
                cell.imageView?.image = UIImage(data: imageData)
            }
            return cell
        }

        return UITableViewCell()
    }

    func fetchContentIfPossible() {
        if let instagramUsername = Suspect.chosenSuspect?.instagramUsername where Suspect.chosenSuspect?.instagramAccessToken != nil {
            instagramClient.getContent(username: instagramUsername,
                success: { [weak self] instagramPosts in
                    self?.refreshPosts(instagramPosts)
                },
                failure: { error in
                }
            )
        }
    }

    private func authenticateWithInstagramIfNeeded() {
        if Suspect.chosenSuspect?.instagramAccessToken == nil {
            let instagramAuthViewController = UIStoryboard.loadViewController(storyboardName: "Feed", identifier: "instagramAuthViewController") as! InstagramAuthViewController
            presenter.present(underlyingViewController: self, viewControllerToPresent: instagramAuthViewController, animated: true, completion: nil)
        }
    }

    private func refreshPosts(instagramPosts: [InstagramPost]) {
        posts = instagramPosts
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            if self.refreshControl.refreshing {
                self.refreshControl.endRefreshing()
            }
        })
    }

    private func setupTableView() {
        tableView.delegate   = self
        tableView.dataSource = self
    }

    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: "fetchContentIfPossible", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl)
    }
}