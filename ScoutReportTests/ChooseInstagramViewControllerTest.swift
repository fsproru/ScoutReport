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
        XCTAssertEqual(Config.chooseInstagramText,      controller.instagramLabel.text)
        XCTAssertEqual(Config.standardBodyFont,         controller.instagramUsernameField.font)
        XCTAssertEqual(Config.standardHeaderFont,       controller.instagramLabel.font)
        XCTAssertEqual(Config.instagramBackgroundColor, controller.view.backgroundColor)
    }

    func testChoosingInstagramUsername() {
        let instagramUsername = "@spidername"
        controller.loadViewIfNeeded()
        controller.instagramUsernameField.text = instagramUsername

        XCTAssertNil(pusher.pushedViewController)
        controller.textFieldShouldReturn(controller.instagramUsernameField)
        XCTAssert(pusher.pushedViewController is ChooseYoutubeViewController)

        let pushedViewController = pusher.pushedViewController as! ChooseYoutubeViewController
        XCTAssertEqual(instagramUsername, pushedViewController.chosenInstagramUsername!)
    }
}