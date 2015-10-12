import XCTest
@testable import ScoutReport

class SuspectTest: XCTestCase {
    func testAttributes() {
        let instagramUsername    = "@chilldude"
        let youtubeUsername      = "chilldudio"
        let instagramAccessToken = "abracadabra"
        var suspect = Suspect(instagramUsername: instagramUsername, youtubeUsername: youtubeUsername)
        XCTAssertEqual(instagramUsername,    suspect.instagramUsername)
        XCTAssertEqual(youtubeUsername,      suspect.youtubeUsername)
        XCTAssertNil(suspect.instagramAccessToken)

        suspect.instagramAccessToken = instagramAccessToken
        XCTAssertEqual(instagramAccessToken, suspect.instagramAccessToken!)
    }
}
