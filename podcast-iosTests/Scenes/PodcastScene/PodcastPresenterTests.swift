//
//  PodcastPresenterTests.swift
//  podcast-iosTests
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import XCTest

class PodcastPresenterTests: XCTestCase {

    var sut: PodcastPresenter?

    override func setUp() {
        super.setUp()
        sut = PodcastPresenter()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testExample() {
    }

}
