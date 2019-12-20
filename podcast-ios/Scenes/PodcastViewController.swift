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
    func showItems(viewModel: PodcastScene.Fetch.ViewModel)
}

class PodcastViewController: UIViewController, PodcastDisplayLogic, UITableViewDelegate, UITableViewDataSource {

    var interactor: PodcastBussinessLogic?
    var items: [Item] = []

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
        tableView.dataSource = self
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
    
    func showItems(viewModel: PodcastScene.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.items = viewModel.items
            self.tableView.reloadData()
        }
    }
    
    // MARK: - View Actions
    @IBAction func tapOnPlayButton(_ sender: Any) {
        interactor?.playMusic()
    }

    // MARK: - UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }

}
