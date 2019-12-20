//
//  PodcastWorker.swift
//  podcast-ios
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import Foundation
import XMLParsing

protocol PodcastWorkerLogic {
    func fetchPodcast(success: @escaping (Channel) -> Void)
}

class PodcastWorker: PodcastWorkerLogic {
    
    var podcastUrl: URL! {
        return URL(string: "https://fapi-top.prisasd.com/podcast/podium/el_gran_apagon/itunestfp/podcast.xml")
    }

    var urlSession: URLSession

    init() {
        urlSession = URLSession.shared
    }

    func fetchPodcast(success: @escaping (Channel) -> Void) {
        urlSession.dataTask(with: podcastUrl) { [weak self] data, response, other    in
            if let data = data {
                do {
                    let rss = try XMLDecoder().decode(Rss.self, from: data)
                    success(rss.channel)
                    return
                } catch _ {
                    self?.error()
                }
            }
            self?.error()
        }.resume()
    }
    
    private func error() {
        debugPrint("not controlled error")
    }
}
