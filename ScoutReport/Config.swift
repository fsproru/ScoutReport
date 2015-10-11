import UIKit

class Config {
    // MARK: - Colors
    static let instagramBackgroundColor = UIColor.blueColor()
    static let youtubeBackgroundColor   = UIColor.redColor()

    // MARK: - Fonts
    static let standardHeaderFont       = UIFont.systemFontOfSize(30, weight: UIFontWeightLight)
    static let standardBodyFont         = UIFont.systemFontOfSize(17, weight: UIFontWeightLight)

    // MARK: - Images
    static let logoImage = UIImage(named: "logo")!

    // MARK: - Text
    static let appNameText         = "Scout Report"
    static let chooseInstagramText = "Type in someone's instagram username below"
    static let chooseYoutubeText   = "and a youtube username of the same person"
}