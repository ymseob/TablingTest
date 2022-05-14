//
//  FavoriteStoreListTableViewHeaderView.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/14.
//

import UIKit

final class FavoriteStoreListTableViewHeaderView: UITableViewHeaderFooterView {
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundView = {
            let view = UIView(frame: self.bounds)
            view.backgroundColor = .white
            return view
        }()
    }
}
