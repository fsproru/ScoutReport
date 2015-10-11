@testable import ScoutReport

extension Suspect {
    static func chooseStubbedSuspect() {
        let instagramUsername = "hulk"
        let youtubeUsername   = "big_nice_green_guy"
        let stubbedSuspect = Suspect(instagramUsername: instagramUsername, youtubeUsername: youtubeUsername)
        Suspect.chosenSuspect = stubbedSuspect
    }
}