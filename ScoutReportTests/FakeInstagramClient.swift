import Foundation
@testable import ScoutReport

class FakeInstagramClient: InstagramClientType {
    var callsToGetContent: [FakeFuncCall] = []

    func getContent(username username: String, success: (([InstagramMedia]) -> Void), failure: ((NSError) -> Void)) {
        let call = FakeFuncCall(arguments: [username])
        callsToGetContent.append(call)
    }
}