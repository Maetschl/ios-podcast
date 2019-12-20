//
//  PodcastDisplayLogicSpy.swift
//  podcast-iosTests
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

@testable import podcast_ios

class PodcastDisplayLogicSpy: PodcastDisplayLogic {
    
    var showLoadingCalled = false

    func showLoading() {
        showLoadingCalled = true
    }
    
    var hideLoadingCalled = false

    func hideLoading() {
        hideLoadingCalled = true
    }
    
    var showItemsCalled = false
    var showItemsViewModel: PodcastScene.Fetch.ViewModel?

    func showItems(viewModel: PodcastScene.Fetch.ViewModel) {
        showItemsViewModel = viewModel
        showItemsCalled = true
    }
    
    
}
