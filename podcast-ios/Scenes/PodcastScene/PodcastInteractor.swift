//
//  PodcastInteractor.swift
//  podcast-ios
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import Foundation

protocol PodcastBussinessLogic {
    func getPodcastList()
}

class PodcastInteractor: PodcastBussinessLogic {
    
    var presenter: PodcastPresentationLogic?

    // MARK: - PodcastBussinessLogic
    func getPodcastList() {
        presenter?.presentLoading()
    }
}
