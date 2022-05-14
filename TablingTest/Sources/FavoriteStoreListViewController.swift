//
//  FavoriteStoreListViewController.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/13.
//

import UIKit

final class FavoriteStoreListViewController: UIViewController {
    @IBOutlet private weak var storeListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        setupTableView()
    }

    private func setupTableView() {
        storeListTableView.register(
            UINib(nibName: StoreTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: StoreTableViewCell.identifier
        )
        storeListTableView.register(
            UINib(nibName: FavoriteStoreListTableViewHeaderView.identifier, bundle: nil),
            forHeaderFooterViewReuseIdentifier: FavoriteStoreListTableViewHeaderView.identifier
        )

        if #available(iOS 15.0, *) {
            storeListTableView.sectionHeaderTopPadding = .zero
        }
    }
}

extension FavoriteStoreListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return StoreTableViewCell.height
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeued = tableView.dequeueReusableCell(withIdentifier: StoreTableViewCell.identifier, for: indexPath)
        guard let cell = dequeued as? StoreTableViewCell else {
            return dequeued
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: FavoriteStoreListTableViewHeaderView.identifier
        ) as? FavoriteStoreListTableViewHeaderView
        headerView?.delegate = self
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return FavoriteStoreListTableViewHeaderView.height
    }
}

extension FavoriteStoreListViewController: FavoriteStoreListTableViewHeaderViewDelegate {
    func favoriteStoreListTableViewHeaderView(
        _ favoriteStoreListTableViewHeaderView: FavoriteStoreListTableViewHeaderView,
        didSelectType: FavoriteStoreListTableViewHeaderView.ListType
    ) {
        print(didSelectType)
    }
}

/*

:  https://my-json-server.typicode.com/tabling/tabling_mobile_test/save
: https://my-json-server.typicode.com/tabling/tabling_mobile_test/recent

 */
