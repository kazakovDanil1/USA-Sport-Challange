import Foundation

struct MatchDetailsModel: Codable {
    let results: [Details]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Details: Codable {
    let stats: [String:[String]]
    let events: [Events]
    
    enum CodingKeys: String, CodingKey {
        case stats
        case events
    }
}

struct Events: Codable {
    let text : String
    
    enum CodingKeys: String, CodingKey {
        case text
    }
}
