import XCTest
@testable import ScoutReport

class SuspectTest {
    func testAttributes() {
        let instagram_username = "@chilldude"
        let youtube_username   = "chilldudio"
        let suspect = Suspect(instagram_username: instagram_username, youtube_username: youtube_username)
        XCTAssertEqual(instagram_username, suspect.instagram_username)
        XCTAssertEqual(youtube_username,   suspect.youtube_username)
    }
}