import XCTest
@testable import ScoutReport

class InstagramAuthViewControllerTest: XCTestCase {
    var controller: InstagramAuthViewController!

    override func setUp() {
        controller = UIStoryboard.loadViewController(storyboardName: "Feed", identifier: "instagramAuthViewController") as! InstagramAuthViewController
    }

    func testInstagramWebViewConfiguration() {
        controller.loadViewIfNeeded()
        XCTAssert(controller.instagramWebView.delegate === controller)
    }

    func testSuccessFulInstagramAuthRequest() {
        let accessToken = "access_granted"
        let request = NSURLRequest(URL: NSURL(string: "https://locahost/#access_token=\(accessToken)")!)
        Suspect.chooseStubbedSuspect(instagramAccessToken: nil)
        controller.loadViewIfNeeded()
        let shouldStartLoadingRequest = controller.webView(controller.instagramWebView, shouldStartLoadWithRequest: request, navigationType: UIWebViewNavigationType.Reload)
        let savedInstagramAccessToken = Suspect.chosenSuspect!.instagramAccessToken!
        XCTAssertFalse(shouldStartLoadingRequest)
        XCTAssertEqual(accessToken, savedInstagramAccessToken)
    }

    func testLoginInstagramAuthRequest() {
        Suspect.chooseStubbedSuspect(instagramAccessToken: nil)
        controller.loadViewIfNeeded()
        let request = NSURLRequest(URL: Config.instagramAuthURL)
        let shouldStartLoadingRequest = controller.webView(controller.instagramWebView, shouldStartLoadWithRequest: request, navigationType: UIWebViewNavigationType.Reload)

        XCTAssertTrue(shouldStartLoadingRequest)
        XCTAssertNil(Suspect.chosenSuspect!.instagramAccessToken)
    }
}