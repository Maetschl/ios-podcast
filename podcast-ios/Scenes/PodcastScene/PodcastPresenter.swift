//
//  PodcastPresenter.swift
//  podcast-ios
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import Foundation

protocol PodcastPresentationLogic {
    func presentLoading()
    func removeLoading()
    func presentList(response: PodcastScene.Fetch.Response)
    func presentPlaying()
    func presentPause()
}

class PodcastPresenter: PodcastPresentationLogic {

    var viewController: PodcastDisplayLogic?
    
    func presentLoading(){
        viewController?.showLoading()
    }
    
    func removeLoading() {
        viewController?.hideLoading()
    }
    
    func presentList(response: PodcastScene.Fetch.Response) {
        let viewModel = PodcastScene.Fetch.ViewModel(items: response.items)
        self.viewController?.showItems(viewModel: viewModel)
    }
    
    func presentPlaying() {
        viewController?.showPlaying()
    }
    
    func presentPause() {
        viewController?.showPause()
    }

}
