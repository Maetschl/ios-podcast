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
    func playOrPauseMusic()
    func selectItem(request: PodcastScene.Play.Request)
}

protocol PodcastDataStore {
    var channel: Channel? { get set }
    var selectedItemIndex: Int? { get set }
    var isPlaying: Bool { get set }
    var isIndexPlaying: Bool { get set }
}

class PodcastInteractor: PodcastBussinessLogic, PodcastDataStore {
    
    // MARK: - PodcastBussinessLogic
    var presenter: PodcastPresentationLogic?
    var worker: PodcastWorkerLogic?
    
    var player = AVPlayer()
    
    // MARK: - PodcastDataStore
    var channel: Channel?
    var selectedItemIndex: Int? = 0
    var isPlaying: Bool = false
    var isIndexPlaying: Bool = false
    
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
    
    func playOrPauseMusic() {
        if isPlaying {
            pause()
        } else {
            play()
        }
        isPlaying = !isPlaying
    }
    
    private func play() {
        if isIndexPlaying {
            continuePlaying()
        } else {
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
                    isIndexPlaying = true
                } catch {
                    print(error)
                }
            }
        }
        presenter?.presentPlaying()
    }
    
    private func continuePlaying() {
        player.play()
    }
    
    private func pause() {
        presenter?.presentPause()
        player.pause()
    }
    
    func selectItem(request: PodcastScene.Play.Request) {
        selectedItemIndex = request.index
        isIndexPlaying = false
        playOrPauseMusic()
    }
}
