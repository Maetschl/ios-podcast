//
//  PodcastWorkerLogicSpy.swift
//  podcast-iosTests
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

@testable import podcast_ios

class PodcastWorkerLogicSpy: PodcastWorkerLogic {
    
    var mockPodCast = Podcast()
    var fetchPodcastCalled = false
    
    init() {
        
    }

    func fetchPodcast(success: @escaping (Podcast) -> Void) {
        fetchPodcastCalled = true
        success(mockPodCast)
    }

}
