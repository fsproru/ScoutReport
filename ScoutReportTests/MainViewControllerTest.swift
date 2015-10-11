import XCTest
@testable import ScoutReport

class MainViewControllerTest: XCTestCase {
    var controller: MainViewController!

    override func setUp() {
        controller = UIStoryboard.loadViewController(storyboardName: "Main", identifier: "mainViewController") as! MainViewController
        controller.loadViewIfNeeded()
    }

    func testAppearance() {
        XCTAssertEqual(Config.appNameText, controller.appNameLabel.text!)
        XCTAssertEqual(Config.logoImage, controller.logoImageView.image!)
    }
}