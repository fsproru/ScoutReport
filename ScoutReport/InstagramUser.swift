import SwiftyJSON

struct InstagramUser {
    let id: String

    init?(json: JSON) {
        if let id = json["id"].string {
            self.id = id
        } else {
            return nil
        }
    }
}