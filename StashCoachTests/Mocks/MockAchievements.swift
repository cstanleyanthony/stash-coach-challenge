// Created by Christian Sarcona on 12/5/20 for Stash
// Stash Coach challenge
// 
	

import Foundation
@testable import StashCoach

struct MockAchievements {
    
    static let overviewItems = OverviewItems(title: "Smart Investing")
    static let overview = Overview(overview: overviewItems)
    
    static let achievement1 = Achievement(level: "1",
                                          progress: 10,
                                          total: 50,
                                          imageUrl: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png",
                                          imageData: nil)
    static let achievement2 = Achievement(level: "2",
                                          progress: 0,
                                          total: 50,
                                          imageUrl: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/341E40C8-1C2A-400C-B67D-F490B74BDD81.png",
                                          imageData: nil)
    static let achievement3 = Achievement(level: "3",
                                          progress: 0,
                                          total: 50,
                                          imageUrl: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C60F6868-A0CD-4D9D-A3B9-3C460FA989FF.png",
                                          imageData: nil)
    
    static let achievementsUnordered: [Achievement] = [
        achievement1,
        achievement3,
        achievement2
    ]
    
    static let achievementsOrdered: [Achievement] = [
        achievement1,
        achievement2,
        achievement3
    ]
    
    /// Should be equavalent to the 'achievementsUnordered' property to test against parsing.
    static let jsonAchievements = """
{
    "overview": {
        "title": "Smart Investing"
    },
    "achievements": [
        {
            "level": "1",
            "progress": 10,
            "total": 50,
            "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png"
        },
        {
            "level": "3",
            "progress": 0,
            "total": 50,
            "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C60F6868-A0CD-4D9D-A3B9-3C460FA989FF.png"
        },
        {
            "level": "2",
            "progress": 0,
            "total": 50,
            "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/341E40C8-1C2A-400C-B67D-F490B74BDD81.png"
        }
    ]
}
""".data(using: .utf8)!
    
    static let jsonAcievementsFile = """
{
    "success": true,
    "status": 200,
    "overview": {
        "title": "Smart Investing"
    },
    "achievements": [
        {
            "id": 4,
            "level": "1",
            "progress": 10,
            "total": 50,
            "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png",
            "accessible": true
        },
        {
            "id": 3,
            "level": "2",
            "progress": 0,
            "total": 50,
            "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/341E40C8-1C2A-400C-B67D-F490B74BDD81.png",
            "accessible": false
        },
        {
            "id": 5,
            "level": "3",
            "progress": 0,
            "total": 50,
            "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C60F6868-A0CD-4D9D-A3B9-3C460FA989FF.png",
            "accessible": false
        }
    ]
}

""".data(using: .utf8)!
    
}
