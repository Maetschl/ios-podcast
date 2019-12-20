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
    
    var sut: PodcastInteractor?

    override func setUp() {
        super.setUp()
        sut = PodcastInteractor()
    }

    override func tearDown() {
        sut = nil
        super.setUp()
    }

    func testExample() {
    }

}
