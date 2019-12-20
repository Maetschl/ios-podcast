//
//  PodcastWorkerLogicSpy.swift
//  podcast-iosTests
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

@testable import podcast_ios

class PodcastWorkerLogicSpy: PodcastWorkerLogic {
    
    var mockChannel: Channel?
    var fetchPodcastCalled = false
    
    init() {
        let item1 = Item(title: "Test item 1", guid: "some url 1")
        let item2 = Item(title: "Test item 2", guid: "some url 2")
        mockChannel = Channel(title: "Test", items: [item1, item2])
    }

    func fetchPodcast(success: @escaping (Channel) -> Void) {
        fetchPodcastCalled = true
        success(mockChannel!)
    }

}
