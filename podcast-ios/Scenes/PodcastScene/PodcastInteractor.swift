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
    var worker: PodcastWorkerLogic?
    
    init() {
        worker = PodcastWorker()
    }

    // MARK: - PodcastBussinessLogic
    func getPodcastList() {
        presenter?.presentLoading()
        worker?.fetchPodcast { [unowned self] podcast in
            self.presenter?.removeLoading()
            self.presenter?.removeLoading()
        }
    }
}
