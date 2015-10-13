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
}