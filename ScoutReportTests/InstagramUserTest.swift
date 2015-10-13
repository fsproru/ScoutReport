import XCTest
@testable import ScoutReport

class InstagramUserTest: XCTestCase {
    func testAttributes() {
        let userID = 1
        let user   = InstagramUser(id: userID)
        XCTAssertEqual(userID, user.id)
    }
}