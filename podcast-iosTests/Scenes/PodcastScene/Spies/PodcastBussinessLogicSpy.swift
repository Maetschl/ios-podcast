//
//  PodcastBussinessLogicSpy.swift
//  podcast-iosTests
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

@testable import podcast_ios

class PodcastBussinessLogicSpy: PodcastBussinessLogic {
    
    var getPodcastListCalled = false

    func getPodcastList() {
        getPodcastListCalled = true
    }
    
    var playOrPauseMusicCalled = false

    func playOrPauseMusic() {
        playOrPauseMusicCalled = true
    }
    
    var selectItemCalled = false

    func selectItem(request: PodcastScene.Play.Request) {
        selectItemCalled = true
    }
}
