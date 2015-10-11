import XCTest
@testable import ScoutReport

class ChooseYoutubeViewControllerTest: XCTestCase {
    var controller: ChooseYoutubeViewController!

    override func setUp() {
        controller = UIStoryboard.loadViewController(storyboardName: "ChooseSuspect", identifier: "chooseYoutubeViewController") as! ChooseYoutubeViewController
        controller.loadViewIfNeeded()
    }

    func testAppearance() {
        XCTAssertEqual(Config.standardHeaderFont,     controller.youtubeLabel.font)
        XCTAssertEqual(Config.standardBodyFont,       controller.youtubeUsernameField.font)
        XCTAssertEqual(Config.youtubeBackgroundColor, controller.view.backgroundColor)
    }
}