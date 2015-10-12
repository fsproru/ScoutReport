import UIKit

class InstagramAuthViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet var instagramWebView: UIWebView!

    override func viewDidLoad() {
        instagramWebView.delegate = self
    }
}