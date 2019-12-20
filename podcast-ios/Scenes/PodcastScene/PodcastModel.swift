//
//  PodcastModel.swift
//  podcast-ios
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import Foundation

enum PodcastScene {
    enum Fetch {
        struct Response {
            let items: [Item]
        }
        struct ViewModel {
            let items: [Item]
        }
    }
}
