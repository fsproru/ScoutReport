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

    func testChoosingYoutubeUsername() {
        let chosenYoutubeUsername   = "batman"
        let chosenInstagramUsername = "batdude"
        controller.youtubeUsernameField.text = chosenYoutubeUsername
        controller.chosenInstagramUsername = chosenInstagramUsername

        XCTAssertNil(Suspect.chosenSuspect)
        controller.textFieldShouldReturn(controller.youtubeUsernameField)
        let chosenSuspect = Suspect.chosenSuspect
        XCTAssert(chosenSuspect != nil)
        XCTAssertEqual(chosenYoutubeUsername, chosenSuspect!.youtubeUsername)
    }
}