import SwiftyJSON

struct InstagramUser {
    let id: Int

    init?(json: JSON) {
        if let id = json["id"].int {
            self.id = id
        } else {
            return nil
        }
    }
}