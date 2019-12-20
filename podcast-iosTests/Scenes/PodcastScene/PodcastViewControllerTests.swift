//
//  PodcastViewControllerTests.swift
//  podcast-iosTests
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import XCTest
@testable import podcast_ios

class PodcastViewControllerTests: XCTestCase {
    
    var sut: PodcastViewController!
    var interactor: PodcastBussinessLogicSpy!

    var window: UIWindow!

    override func setUp() {
        super.setUp()
        window = UIWindow()

        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "PodcastViewController") as! PodcastViewController
        interactor = PodcastBussinessLogicSpy()
        sut.interactor = interactor
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    func testViewLifeCycleCallsInteractorGetPodcastList() {
        // Given
        // When
        loadView()
        // Then
        XCTAssertTrue(interactor.getPodcastListCalled)
    }

}
