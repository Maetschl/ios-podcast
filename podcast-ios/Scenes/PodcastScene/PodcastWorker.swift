//
//  PodcastWorker.swift
//  podcast-ios
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import Foundation

protocol PodcastWorkerLogic {
    func fetchPodcast(success: @escaping (Podcast) -> Void)
}

class PodcastWorker: PodcastWorkerLogic {
    func fetchPodcast(success: @escaping (Podcast) -> Void) {
//        success(podcast)
    }
}
