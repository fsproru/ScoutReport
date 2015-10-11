import XCTest
@testable import ScoutReport

class SuspectTest {
    func testAttributes() {
        let instagramUsername = "@chilldude"
        let youtubeUsername   = "chilldudio"
        let suspect = Suspect(instagramUsername: instagramUsername, youtubeUsername: youtubeUsername)
        XCTAssertEqual(instagramUsername, suspect.instagramUsername)
        XCTAssertEqual(youtubeUsername,   suspect.youtubeUsername)
    }
}
