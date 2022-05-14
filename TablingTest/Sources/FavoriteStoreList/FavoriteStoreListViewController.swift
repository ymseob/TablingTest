//
//  FavoriteStoreListViewController.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/13.
//

import UIKit
import RxSwift

enum FavoriteStoreListType {
    case saved
    case recently
}

final class FavoriteStoreListViewController: UIViewController {
    @IBOutlet private weak var storeListTableView: UITableView!
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!

    private let viewModel = FavoriteStoreListViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetch()
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

    private func fetch() {
        indicatorView.startAnimating()
        Observable.zip(
            viewModel.fetchSavedList(),
            viewModel.fetchRecentlyList()
        )
        .subscribe(with: self) { owner, _ in
            owner.viewModel.selectListType(.saved)
            owner.storeListTableView.reloadData()
            owner.indicatorView.stopAnimating()
        }
        .disposed(by: disposeBag)
    }
}

extension FavoriteStoreListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        StoreTableViewCell.height
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeued = tableView.dequeueReusableCell(withIdentifier: StoreTableViewCell.identifier, for: indexPath)
        guard let cell = dequeued as? StoreTableViewCell else {
            return dequeued
        }
        if let store = viewModel.store(for: indexPath.row) {
            cell.configure(store)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FavoriteStoreListTableViewHeaderView.identifier) as? FavoriteStoreListTableViewHeaderView
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
        didSelectType: FavoriteStoreListType
    ) {
        viewModel.selectListType(didSelectType)
        storeListTableView.reloadData()
    }
}
