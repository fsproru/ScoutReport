import XCTest
import SwiftyJSON
@testable import ScoutReport

class InstagramPostTest: XCTestCase {
    func testAttributesFromJSON() {
        let urlString = "http://s3.aws.amazon.com/my_fancy_picture.jpg"
        let json = JSON([
            "images": [
                "standard_resolution": [
                    "url": urlString
                ]
            ]
        ])
        let post = InstagramPost(json: json)
        XCTAssertEqual(urlString, post!.imageURLString)
    }
}