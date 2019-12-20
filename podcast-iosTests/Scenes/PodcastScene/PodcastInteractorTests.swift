//
//  PodcastInteractorTests.swift
//  podcast-iosTests
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import XCTest
@testable import podcast_ios

class PodcastInteractorTests: XCTestCase {
    
    var sut: PodcastInteractor!
    var presenter: PodcastPresentationLogicSpy!
    var worker: PodcastWorkerLogicSpy!

    override func setUp() {
        super.setUp()
        sut = PodcastInteractor()
        
        presenter = PodcastPresentationLogicSpy()
        sut.presenter = presenter
        
        worker = PodcastWorkerLogicSpy()
        sut.worker = worker
    }

    override func tearDown() {
        sut = nil
        super.setUp()
    }
    
    func testOnGetPodcastListCallWorkerAndAddLoadingAndRemoveLoading() {
        // Given
        // When
        sut?.getPodcastList()
        // Then
        XCTAssertTrue(presenter.presentLoadingCalled)
        XCTAssertTrue(presenter.removeLoadingCalled)
        XCTAssertTrue(worker.fetchPodcastCalled)
    }
    
    func testOnGetPodcastListCallWorkerAndStoreData() {
        // Given
        // When
        sut?.getPodcastList()
        // Then
        XCTAssertNotNil(sut?.channel)
    }

}
