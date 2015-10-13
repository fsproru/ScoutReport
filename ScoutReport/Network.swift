import Foundation

protocol NetworkType {
    func get(urlString: String, success: ((data: NSData?) -> Void), failure: ((error: NSError) -> Void))
}

class Network: NetworkType {
    func get(urlString: String, success: ((data: NSData?) -> Void), failure: ((error: NSError) -> Void)) {

        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            let task    = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { data, response, error in
                success(data: data)
            })

            task.resume()
        } else {
            let badURLError = NSError(domain: Config.scoutReportErrorDomain, code: Config.scoutReportErrorCode, userInfo: ["BadURL":urlString])
            failure(error: badURLError)
        }
    }
}