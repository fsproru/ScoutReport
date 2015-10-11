import XCTest
@testable import ScoutReport

class ChooseYoutubeViewControllerTest: XCTestCase {
    var controller: ChooseYoutubeViewController!
    let dismisser = FakeDismisser()

    override func setUp() {
        controller = UIStoryboard.loadViewController(storyboardName: "ChooseSuspect", identifier: "chooseYoutubeViewController") as! ChooseYoutubeViewController
        controller.dismisser = dismisser
        controller.loadViewIfNeeded()
    }

    func testAppearance() {
        XCTAssertEqual(Config.youtubeLogoImage,                controller.youtubeLogoImageView.image)
        XCTAssertEqual(Config.chooseYoutubeText,               controller.youtubeLabel.text)
        XCTAssertEqual(Config.standardHeaderFont,              controller.youtubeLabel.font)
        XCTAssertEqual(Config.standardBodyFont,                controller.youtubeUsernameField.font)
        XCTAssertEqual(Config.youtubeBackgroundColor,          controller.view.backgroundColor)
        XCTAssertEqual(Config.standardInputFieldTextAlignment, controller.youtubeUsernameField.textAlignment)
    }

    func testChoosingYoutubeUsername() {
        let chosenYoutubeUsername   = "batman"
        let chosenInstagramUsername = "batdude"

        controller.youtubeUsernameField.text = nil
        controller.chosenInstagramUsername   = nil
        XCTAssertNil(Suspect.chosenSuspect)
        XCTAssertNil(dismisser.dismissedViewController)

        controller.youtubeUsernameField.text = chosenYoutubeUsername
        controller.chosenInstagramUsername   = chosenInstagramUsername
        controller.textFieldShouldReturn(controller.youtubeUsernameField)
        let chosenSuspect = Suspect.chosenSuspect
        XCTAssert(chosenSuspect != nil)
        XCTAssertEqual(chosenYoutubeUsername, chosenSuspect!.youtubeUsername)
        XCTAssertEqual(dismisser.dismissedViewController, controller)
    }
}