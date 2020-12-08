// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
//

import Foundation

struct Achievement {
    let level: String
    let imageUrl: String
    var imageData: Data?
}

extension Achievement: Codable {
    enum CodingKeys: String, CodingKey {
        case level
        case imageUrl = "bg_image_url"
    }
}

extension Achievement: Equatable {
    static func ==(lhs: Achievement,
                   rhs: Achievement) -> Bool {
        return lhs.level == rhs.level
    }
}

/// A simple struct that holds the array of achievements used to parse JSON.
struct Achievements: Codable {
    let achievements: [Achievement]
}
