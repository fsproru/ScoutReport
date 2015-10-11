import XCTest
@testable import ScoutReport

class MainViewControllerTest: XCTestCase {
    var controller: MainViewController!
    var presenter = FakePresenter()

    override func setUp() {
        controller = UIStoryboard.loadViewController(storyboardName: "Main", identifier: "mainViewController") as! MainViewController
        controller.presenter = presenter
    }

    func testAppearance() {
        controller.loadViewIfNeeded()
        XCTAssertEqual(Config.standardHeaderFont, controller.appNameLabel.font)
        XCTAssertEqual(Config.appNameText,        controller.appNameLabel.text!)
        XCTAssertEqual(Config.logoImage,          controller.logoImageView.image!)
    }

    func testWhenNoSuspectIsChosen() {
        Suspect.chosenSuspect = nil
        XCTAssertNil(presenter.presentedViewController)

        controller.beginAppearanceTransition(true, animated: false)
        controller.endAppearanceTransition()
        let presentedViewController = presenter.presentedViewController as! UINavigationController
        XCTAssert(presentedViewController.topViewController is ChooseInstagramViewController)
    }
}