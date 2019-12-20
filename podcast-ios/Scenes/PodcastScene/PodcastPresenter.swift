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
}

class PodcastPresenter: PodcastPresentationLogic {

    var viewController: PodcastDisplayLogic?
    
    func presentLoading(){
        viewController?.showLoading()
    }

}
