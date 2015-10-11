import XCTest
@testable import ScoutReport

class ChooseInstagramViewControllerTest: XCTestCase {
    var controller: ChooseInstagramViewController!
    let pusher = FakePusher()

    override func setUp() {
        super.setUp()
        controller = UIStoryboard.loadViewController(storyboardName: "ChooseSuspect", identifier: "chooseInstagramViewController") as! ChooseInstagramViewController
        controller.pusher = pusher
        setupNavigationControllerViewStack(viewController: controller)
        controller.loadViewIfNeeded()
    }

    func testAppearance() {
        XCTAssertEqual(Config.standardBodyFont,       controller.instagramUsernameField.font)
        XCTAssertEqual(Config.standardHeaderFont,       controller.instagramLabel.font)
        XCTAssertEqual(Config.instagramBackgroundColor, controller.view.backgroundColor)
    }

    func testChoosingInstagram() {
        controller.loadViewIfNeeded()
        controller.instagramUsernameField.text = "@spiderman"

        XCTAssertNil(pusher.pushedViewController)
        controller.textFieldShouldReturn(controller.instagramUsernameField)
        XCTAssert(pusher.pushedViewController is ChooseYoutubeViewController)
    }
}