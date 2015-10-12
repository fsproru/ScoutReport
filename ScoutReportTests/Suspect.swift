@testable import ScoutReport

extension Suspect {
    static func chooseStubbedSuspect(instagramUsername instagramUsername: String = "hulk", youtubeUsername: String = "big_nice_green_guy", instagramAccessToken: String? = nil) {
        let stubbedSuspect = Suspect(instagramUsername: instagramUsername, youtubeUsername: youtubeUsername, instagramAccessToken: instagramAccessToken)
        Suspect.chosenSuspect = stubbedSuspect
    }
}