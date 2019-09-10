//
//  ViewController.swift
//  EOSBlock
//
//  Created by Jason wang on 9/7/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class EOSBlockListController: UIViewController, LoaderableView {
    private let refreshController = UIRefreshControl()
    let tableview = UITableView()
    var activityIndicator = EOSActivityView(frame: .zero)
    var viewModel: EOSBlockListViewable?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.title
        view.addSubviews(tableview, activityIndicator)
        refreshController.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        activityIndicator.centerSuperview()
        setupTableView()
        viewModel?.fetchMostRecentBlocks(20)
    }

    func setupTableView() {
        tableview.fillToSuperview()
        tableview.register(EOSBlockCell.self)
        tableview.refreshControl = refreshController
        tableview.dataSource = self
        tableview.delegate = self
    }

    @IBAction func handleRefresh() {
        refreshController.endRefreshing()
        viewModel?.fetchMostRecentBlocks(20)
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
        tableview.deselectRow(at: indexPath, animated: true)
        guard let selectedBlock = viewModel?.blockItem(indexPath.row) else { return }
        // TODO: Implement Coordinator Pattern
        let vm = EOSBlockDetailViewModel(manager: appSession.eosManager, blockNum: selectedBlock)
        let detailVC = EOSBlockDetailController()
        detailVC.viewModel = vm
        vm.delegate = detailVC
        navigationController?.pushViewController(detailVC, animated: true)
        // TODO: END
    }

}

extension EOSBlockListController: EOSViewModelDelegate {

    func viewModelUpdated() {
        tableview.reloadData()
    }

}

