import Foundation
import SwiftyJSON

protocol InstagramClientType {
    func getContent(username username: String, success: (([InstagramPost]) -> Void), failure: ((NSError) -> Void))
}

class InstagramClient: InstagramClientType {
    var network: NetworkType = Network()

    func getContent(username username: String, success: (([InstagramPost]) -> Void), failure: ((NSError) -> Void)) {
        findUser(username: username,
            success: { [weak self] user in
                if let user = user {
                    self?.getPosts(user.id,
                        success: { posts in
                            success(posts)
                        },
                        failure: { error in }
                    )
                }
            },
            failure: { error in }
        )
    }

    private func findUser(username username: String, success: ((InstagramUser?) -> Void), failure: ((NSError) -> Void)) {
        if let token = Suspect.chosenSuspect?.instagramAccessToken {
            let urlString = "https://api.instagram.com/v1/users/search?q=\(username)&access_token=\(token)"
            network.get(urlString,
                success: { data  in
                    if let data = data {
                        let json = JSON(data: data)
                        let user = InstagramUser(json: json["data"][0])
                        success(user)
                    }
                },
                failure: { error in }
            )
        }
    }

    private func getPosts(userID: String, success: (([InstagramPost]) -> Void), failure: ((NSError) -> Void)) {
        if let token = Suspect.chosenSuspect?.instagramAccessToken {
            let urlString = "https://api.instagram.com/v1/users/\(userID)/media/recent/?access_token=\(token)"
            network.get(urlString,
                success: { data in
                    if let data = data {
                        let json  = JSON(data: data)
                        var posts = [InstagramPost]()

                        if let jsonPosts = json["data"].array {
                            for jsonPost in jsonPosts {
                                if let post = InstagramPost(json: jsonPost) {
                                    posts.append(post)
                                }
                            }
                        }

                        success(posts)
                    }
                },
                failure: { error in }
            )
        }
    }
}