import UIKit

class Config {
    // MARK: - Colors
    static let instagramBackgroundColor = UIColor.whiteColor()
    static let youtubeBackgroundColor   = UIColor.whiteColor()

    // MARK: - Fonts
    static let standardHeaderFont       = UIFont.systemFontOfSize(30, weight: UIFontWeightLight)
    static let standardBodyFont         = UIFont.systemFontOfSize(17, weight: UIFontWeightLight)

    // MARK: - Images
    static let logoImage          = UIImage(named: "logo")!
    static let instagramLogoImage = UIImage(named: "instagram-logo")!
    static let youtubeLogoImage   = UIImage(named: "youtube-logo")!

    // MARK: - Text
    static let appNameText         = "Scout Report"
    static let chooseInstagramText = "Type in someone's instagram username below"
    static let chooseYoutubeText   = "and a youtube username of the same person"

    // MARK: - Text Attributes
    static let standardInputFieldTextAlignment: NSTextAlignment = .Center

    // MARK: - Instagram API
    static let instagramAuthURL = NSURL(string: "https://instagram.com/oauth/authorize/?client_id=f82a6b07a9924d2f86ef69e961242855&redirect_uri=https://localhost&response_type=token")!
    static let instagramAccessTokenURLSubstring = "#access_token="
}