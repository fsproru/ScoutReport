import UIKit

class InstagramAuthViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet var instagramWebView: UIWebView!
    var dismisser: DismisserType = Dismisser()

    override func viewDidLoad() {
        instagramWebView.delegate = self
        loadInstagramRequest(webView: instagramWebView)
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let urlString = request.URL?.absoluteString {
            if let accessToken = urlString.componentsSeparatedByString(Config.instagramAccessTokenURLSubstring).last where urlString.rangeOfString(Config.instagramAccessTokenURLSubstring) != nil {
                Suspect.chosenSuspect?.instagramAccessToken = accessToken
                dismisser.dismiss(viewController: self, animated: true, completion: nil)
                return false
            }
        }

        return true
    }

    private func loadInstagramRequest(webView webView: UIWebView) {
        let request = NSURLRequest(URL: Config.instagramAuthURL)
        instagramWebView.loadRequest(request)
    }

}