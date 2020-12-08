// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
//

import Foundation

struct Achievement {
    let level: String
    let progress: Int
    let total: Int
    let imageUrl: String
    var imageData: Data?
    let accessible: Bool
}

extension Achievement: Codable {
    enum CodingKeys: String, CodingKey {
        case level,
             progress,
             total,
             imageUrl = "bg_image_url",
             accessible
    }
}

extension Achievement: Equatable {
    static func ==(lhs: Achievement,
                   rhs: Achievement) -> Bool {
        return lhs.level == rhs.level
            && lhs.progress == rhs.progress
            && lhs.imageUrl == rhs.imageUrl
            && lhs.imageData == rhs.imageData
            && lhs.accessible == rhs.accessible
    }
}

/// A simple struct that holds the array of achievements used to parse JSON.
struct Achievements: Codable {
    let achievements: [Achievement]
}

struct Overview: Codable {
    let overview: OverviewItems
}

extension Overview: Equatable {
    static func == (lhs: Overview, rhs: Overview) -> Bool {
        return lhs.overview == rhs.overview
    }
}

/// A simple struct to hold the overview items.
struct OverviewItems: Codable {
    let title: String
}

extension OverviewItems: Equatable {
    static func == (lhs: OverviewItems, rhs: OverviewItems) -> Bool {
        return lhs.title == rhs.title
    }
}
