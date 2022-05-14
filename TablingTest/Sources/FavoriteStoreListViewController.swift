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
        storeListTableView.register(UINib(nibName: "StoreTableViewCell", bundle: nil), forCellReuseIdentifier: "StoreTableViewCell")
        storeListTableView.register(UINib(nibName: "FavoriteStoreListTableViewHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "FavoriteStoreListTableViewHeaderView")

        if #available(iOS 15.0, *) {
            storeListTableView.sectionHeaderTopPadding = .zero
        }
    }
}

extension FavoriteStoreListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeued = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath)
        guard let cell = dequeued as? StoreTableViewCell else {
            return dequeued
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FavoriteStoreListTableViewHeaderView")
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}

/*

:  https://my-json-server.typicode.com/tabling/tabling_mobile_test/save
: https://my-json-server.typicode.com/tabling/tabling_mobile_test/recent

 */
