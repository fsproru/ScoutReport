import Foundation

protocol InstagramClientType {
    func getContent(username username: String, success: (([InstagramPost]) -> Void), failure: ((NSError) -> Void))
}

class InstagramClient: InstagramClientType {
    var network: NetworkType = Network()

    func getContent(username username: String, success: (([InstagramPost]) -> Void), failure: ((NSError) -> Void)) {
        findUser(username: username,
            success: { user  in },
            failure: { error in }
        )
    }

    private func findUser(username username: String, success: ((InstagramUser?) -> Void), failure: ((NSError) -> Void)) {
        if let token = Suspect.chosenSuspect?.instagramAccessToken {
            let urlString = "https://api.instagram.com/v1/users/search?q=\(username)&access_token=\(token)"
            network.get(urlString,
                success: { data  in },
                failure: { error in }
            )
        }
    }
}