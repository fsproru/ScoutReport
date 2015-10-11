import Foundation

protocol InstagramClientType {
    func getContent(username username: String, success: (([InstagramMedia]) -> Void), failure: ((NSError) -> Void))
}

class InstagramClient: InstagramClientType {
    func getContent(username username: String, success: (([InstagramMedia]) -> Void), failure: ((NSError) -> Void)) {
    }
}