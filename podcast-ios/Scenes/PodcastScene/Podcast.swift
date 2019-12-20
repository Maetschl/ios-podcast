//
//  PodcastModels.swift
//  podcast-ios
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import Foundation

struct Rss: Codable {
    var channel: Channel
}

struct Channel: Codable {
    var title: String
    var items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case items = "item"
    }
}

struct Item: Codable {
    // Title of episode
    var title: String
    // Url of episode
    var guid: String
}
