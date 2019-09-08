//
//  ViewController.swift
//  EOSBlock
//
//  Created by Jason wang on 9/7/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class EOSBlockListController: UIViewController {
    
    let tableview = UITableView()
    let activityIndicator = EOSActivityView(frame: .zero)
    var viewModel: EOSBlockListViewable?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.title
        view.addSubviews(tableview, activityIndicator)
        activityIndicator.centerSuperview()
        setupTableView()
        viewModel?.delegate = self
    }

    func setupTableView() {
        tableview.fillToSuperview()
        tableview.register(EOSBlockCell.self)
        tableview.dataSource = self
        tableview.delegate = self
    }

}

extension EOSBlockListController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.blockCounts ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(indexPath: indexPath) as EOSBlockCell
        guard let item = viewModel?.blockItem(indexPath.row) else { return UITableViewCell() }
        cell.configCell(item)
        return cell
    }

}

extension EOSBlockListController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedBlock = viewModel?.blockItem(indexPath.row) else { return }
        print(selectedBlock)
    }

}

extension EOSBlockListController: EOSBlockListViewModelDelegate {

    func viewModelUpdated() {
        tableview.reloadData()
    }

    func loading(state: LoadingState<EOSManagerError>) {
        switch state {
        case .start:
            activityIndicator.startAnimating()
        case .stop(status: let status):
            activityIndicator.stopAnimating()
            guard case let .failure(err: err) = status else { return }
            showAlert(err)
        }
    }

}

