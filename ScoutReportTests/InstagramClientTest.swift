import XCTest
@testable import ScoutReport

class InstagramClientTest: XCTestCase {
    let client               = InstagramClient()
    let network              = FakeNetwork()

    override func setUp() {
        client.network = network
    }

    func testGetContent() {
        let username    = "flash"
        let accessToken = "allGood"
        Suspect.chooseStubbedSuspect(instagramAccessToken: accessToken)
        XCTAssertEqual(0, network.callsToGet.count)

        client.getContent(username: username,
            success: { posts in },
            failure: { error in }
        )

        let findUserCall          = network.callsToGet[0]
        let findUserRequestString = findUserCall.arguments[0] as! String

        XCTAssertEqual(1, network.callsToGet.count)
        XCTAssertEqual(findUserRequestString, "https://api.instagram.com/v1/users/search?q=\(username)&access_token=\(accessToken)")
    }
}