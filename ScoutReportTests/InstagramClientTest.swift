import XCTest
@testable import ScoutReport

class InstagramClientTest: XCTestCase {
    let client               = InstagramClient()
    let network              = FakeNetwork()

    override func setUp() {
        client.network = network
    }

    func testGetContent() {
        let username = "flash"
        Suspect.chooseStubbedSuspect(instagramAccessToken: "allGoood")
        XCTAssertEqual(0, network.callsToGet.count)

        client.getContent(username: username,
            success: { posts in },
            failure: { error in }
        )

        let call          = network.callsToGet[0]
        let requestString = call.arguments[0] as! String

        XCTAssertEqual(1, network.callsToGet.count)
        XCTAssert(requestString.rangeOfString(username) != nil)
    }
}