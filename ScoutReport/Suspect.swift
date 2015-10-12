struct Suspect {
    let instagramUsername:    String
    let youtubeUsername:      String
    var instagramAccessToken: String?

    init(instagramUsername: String, youtubeUsername: String, instagramAccessToken: String? = nil) {
        self.instagramUsername    = instagramUsername
        self.youtubeUsername      = youtubeUsername
        self.instagramAccessToken = instagramAccessToken
    }

    static var chosenSuspect: Suspect?
}
