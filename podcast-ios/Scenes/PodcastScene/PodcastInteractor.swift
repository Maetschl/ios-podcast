//
//  PodcastInteractor.swift
//  podcast-ios
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import AVFoundation

protocol PodcastBussinessLogic {
    func getPodcastList()
    func playMusic()
    func selectItem(request: PodcastScene.Play.Request)
}

protocol PodcastDataStore {
    var channel: Channel? { get set }
    var selectedItemIndex: Int? { get set }
}

class PodcastInteractor: PodcastBussinessLogic, PodcastDataStore {
    
    // MARK: - PodcastBussinessLogic
    var presenter: PodcastPresentationLogic?
    var worker: PodcastWorkerLogic?
    
    var player = AVPlayer()
    
    // MARK: - PodcastDataStore
    var channel: Channel?
    var selectedItemIndex: Int? = 0
    
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
    
    func playMusic() {
        if let selectedItemIndex = selectedItemIndex, let channel = channel {
            let urlString = channel.items[selectedItemIndex].guid
            guard let url = URL.init(string: urlString) else { return }
            let playerItem = AVPlayerItem.init(url: url)
            player = AVPlayer.init(playerItem: playerItem)
            do {
                try AVAudioSession.sharedInstance()
                    .setCategory(
                        AVAudioSession.Category.playback,
                        mode: AVAudioSession.Mode.default,
                        options: [.allowAirPlay]
                )
                try AVAudioSession.sharedInstance()
                    .setActive(true)
                player.play()
            } catch {
                print(error)
            }
        }
    }
    
    func selectItem(request: PodcastScene.Play.Request) {
        selectedItemIndex = request.index
        playMusic()
    }
}
