import Foundation
@testable import ScoutReport

class FakeNetwork: NetworkType {
    var callsToGet: [FakeFuncCall] = []

    func get(urlString: String, success: ((data: NSData?) -> Void), failure: ((error: NSError) -> Void)) {
        let call = FakeFuncCall(arguments: [urlString])
        callsToGet.append(call)
    }
}