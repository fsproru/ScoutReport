import XCTest
@testable import ScoutReport

class ChooseSuspectControllerTest: XCTestCase {
    func testChoosingInstagram() {
        let window                = UIWindow()
        let navigationController  = UIStoryboard.loadViewController(storyboardName: "ChooseSuspect", identifier: "chooseSuspectNavigationController") as! UINavigationController
        let controller            = navigationController.topViewController! as! ChooseSuspectController
        let pusher                = FakePusher()
        controller.pusher         = pusher
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        controller.loadViewIfNeeded()
        controller.instagramUsernameField.text = "@spiderman"

        XCTAssertNil(pusher.pushedViewController)
        controller.textFieldShouldReturn(controller.instagramUsernameField)
        XCTAssert(pusher.pushedViewController is ChooseYoutubeViewController)
    }
}