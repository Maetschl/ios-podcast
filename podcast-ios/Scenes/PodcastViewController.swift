//
//  ViewController.swift
//  podcast-ios
//
//  Created by Julian Arias Maetschl on 12/20/19.
//  Copyright © 2019 Julian Arias Maetschl. All rights reserved.
//

import UIKit

protocol PodcastDisplayLogic {
    func showLoading()
}

class PodcastViewController: UIViewController, PodcastDisplayLogic {

    var interactor: PodcastBussinessLogic?

    // MARK: - Object lifecycle

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Architecture Setup

    private func setup() {
        let viewController = self
        let interactor = PodcastInteractor()
        let presenter = PodcastPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

    // MARK: - View controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getPodcastList()
    }
    
    // MARK: - PodcastDisplayLogic
    
    func showLoading() {
        // Show lottie for loading
    }

}
