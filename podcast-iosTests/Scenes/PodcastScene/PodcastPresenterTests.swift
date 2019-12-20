//
//  PodcastPresenterTests.swift
//  podcast-iosTests
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import XCTest
@testable import podcast_ios

class PodcastPresenterTests: XCTestCase {

    var sut: PodcastPresenter?
    var viewController: PodcastDisplayLogicSpy!

    override func setUp() {
        super.setUp()
        sut = PodcastPresenter()
        
        viewController = PodcastDisplayLogicSpy()
        sut?.viewController = viewController
        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testPresentItems() {
        // Given
        let items = [Item(title: "Test", guid: "Test string")]
        let response = PodcastScene.Fetch.Response(items: items)
        // When
        sut?.presentList(response: response)
        // Then
        XCTAssertTrue(self.viewController.showItemsCalled)
    }

}
