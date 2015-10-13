import SwiftyJSON

struct InstagramPost {
    let imageURLString: String

    init?(json: JSON) {
        if let urlString = json["images"]["standard_resolution"]["url"].string {
            self.imageURLString = urlString
        } else {
            return nil
        }
    }
}