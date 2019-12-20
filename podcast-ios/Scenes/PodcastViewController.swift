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
    func hideLoading()
}

class PodcastViewController: UIViewController, PodcastDisplayLogic, UITableViewDelegate {

    var interactor: PodcastBussinessLogic?

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stackView: UIStackView!
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
        tableView.delegate = self
        interactor?.getPodcastList()
    }

    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        if toInterfaceOrientation == .portrait ||
           toInterfaceOrientation == .portraitUpsideDown {
            stackView.axis = .vertical
        } else {
            stackView.axis = .horizontal
        }
    }

    // MARK: - PodcastDisplayLogic
    
    func showLoading() {
        // Show lottie for loading
    }
    
    func hideLoading() {
        // Hide lottie
    }
        
    // MARK: - UITableViewDelegate

}
