import XCTest
import SwiftyJSON
@testable import ScoutReport

class InstagramUserTest: XCTestCase {
    func testAttributesFromJSON() {
        let id   = "1"
        let json = JSON(["id": id])
        let user = InstagramUser(json: json)
        XCTAssertEqual(id, user!.id)
    }
}