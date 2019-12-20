//
//  PodcastPresentationLogicSpy.swift
//  podcast-iosTests
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

@testable import podcast_ios

class PodcastPresentationLogicSpy: PodcastPresentationLogic {
    
    var presentLoadingCalled = false

    func presentLoading() {
        presentLoadingCalled = true
    }
    
    var removeLoadingCalled = false

    func removeLoading() {
        removeLoadingCalled = true
    }
    
    var presentListCalled = false
    var presentListResponse: PodcastScene.Fetch.Response?

    func presentList(response: PodcastScene.Fetch.Response) {
        presentListCalled = true
        presentListResponse = response
    }

    var presentPlayingCalled = false

    func presentPlaying() {
        presentPlayingCalled = true
    }
    
    var presentPauseCalled = false

    func presentPause() {
        presentPauseCalled = true
    }

}
