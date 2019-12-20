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

protocol PodcastDataStore {
    var channel: Channel? { get set }
}

class PodcastInteractor: PodcastBussinessLogic, PodcastDataStore {
    
    // MARK: - PodcastBussinessLogic
    var presenter: PodcastPresentationLogic?
    var worker: PodcastWorkerLogic?
    
    // MARK: - PodcastDataStore
    var channel: Channel?
    
    init() {
        worker = PodcastWorker()
    }

    // MARK: - PodcastBussinessLogic
    func getPodcastList() {
        presenter?.presentLoading()
        worker?.fetchPodcast { [unowned self] channel in
            // Store the data from worker for uses
            self.channel = channel
            self.presenter?.removeLoading()
            let response = PodcastScene.Fetch.Response(items: channel.items)
            self.presenter?.presentList(response: response)
        }
    }
}
