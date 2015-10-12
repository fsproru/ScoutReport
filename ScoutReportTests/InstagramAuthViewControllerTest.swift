import XCTest
@testable import ScoutReport

class InstagramAuthViewControllerTest: XCTestCase {
    var controller: InstagramAuthViewController!

    override func setUp() {
        controller = UIStoryboard.loadViewController(storyboardName: "Feed", identifier: "instagramAuthViewController") as! InstagramAuthViewController
    }

    func testInstagramWebView() {
        controller.loadViewIfNeeded()
        XCTAssert(controller.instagramWebView.delegate === controller)
    }
}