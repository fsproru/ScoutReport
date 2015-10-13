import XCTest
@testable import ScoutReport

class FeedViewControllerTest: XCTestCase {
    var controller: FeedViewController!
    let instagramClient = FakeInstagramClient()
    let presenter = FakePresenter()

    override func setUp() {
        Suspect.chooseStubbedSuspect()
        controller = UIStoryboard.loadViewController(storyboardName: "Feed", identifier: "feedViewController") as! FeedViewController
        controller.instagramClient = instagramClient
        controller.presenter       = presenter
    }

    func testInstagramAuthIfSuspectIsAuthenticated() {
        Suspect.chooseStubbedSuspect(instagramAccessToken: "accessGranted")
        controller.loadViewIfNeeded()
        XCTAssertNil(presenter.presentedViewController)
    }

    func testInstagramAuthIfSuspectIsNotAuthenticated() {
        Suspect.chosenSuspect!.instagramAccessToken = nil
        controller.loadViewIfNeeded()
        XCTAssert(presenter.presentedViewController is InstagramAuthViewController)
    }

    func testInstagramFeed() {
        Suspect.chooseStubbedSuspect(instagramAccessToken: "allGood")
        XCTAssertEqual(0, instagramClient.callsToGetContent.count)
        controller.beginAppearanceTransition(true, animated: false)
        controller.endAppearanceTransition()
        XCTAssertEqual(1, instagramClient.callsToGetContent.count)
    }

    func testDisplayingInstagramPosts() {
        let urlString = "http://s3.aws.amazon.com/my_fancy_picture.jpg"
        let posts = [InstagramPost(imageURLString: urlString)]
        controller.posts = posts
        controller.loadViewIfNeeded()
        XCTAssertEqual(1, controller.tableView(controller.tableView, numberOfRowsInSection: 0))
    }
}