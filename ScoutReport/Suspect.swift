struct Suspect {
    let instagramUsername:    String
    let youtubeUsername:      String
    var instagramAccessToken: String?

    init(instagramUsername: String, youtubeUsername: String) {
        self.instagramUsername = instagramUsername
        self.youtubeUsername   = youtubeUsername
    }

    static var chosenSuspect: Suspect?
}
