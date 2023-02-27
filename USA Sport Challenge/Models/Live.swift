//Made by Kazakov Danil
//USA Sport Challenge in 2023

import Foundation

struct Live: Codable {
    let gamesLive: [GamesLive]

    enum CodingKeys: String, CodingKey {
        case gamesLive = "games_live"
    }
}

// MARK: - GamesPre
struct GamesLive: Codable {
    let gameID, time, timeStatus, timer, score: String
    let league, home, away: AwayLive

    enum CodingKeys: String, CodingKey {
        case gameID = "game_id"
        case timeStatus = "time_status"
        case time
        case score
        case league, home, away, timer
    }
}

// MARK: - Away
struct AwayLive: Codable {
    let name, id: String
    let imageID: String?
    let cc: String

    enum CodingKeys: String, CodingKey {
        case name, id
        case imageID = "image_id"
        case cc
    }
}
