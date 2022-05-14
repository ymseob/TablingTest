//
//  StoreTableViewCell.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/13.
//

import UIKit
import Kingfisher

final class StoreTableViewCell: UITableViewCell {
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var newBadgeView: UIView!
    @IBOutlet private weak var waitingContainerView: UIView!
    @IBOutlet private weak var waitingLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var starImageView: UIImageView!
    @IBOutlet private weak var storeNameLabel: UILabel!
    @IBOutlet private weak var rateLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var typeContainerView: UIView!
    @IBOutlet private weak var typeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        clearUI()
    }

    private func setupUI() {
        newBadgeView.layer.cornerRadius = 5
        thumbnailImageView.layer.cornerRadius = 5
        waitingContainerView.layer.cornerRadius = 5
        typeContainerView.layer.cornerRadius = 3

        thumbnailImageView.layer.borderColor = UIColor.separator.cgColor
        thumbnailImageView.layer.borderWidth = 0.5
    }

    private func clearUI() {
        newBadgeView.isHidden = true
        waitingContainerView.isHidden = true
        thumbnailImageView.image = nil
        starImageView.image = Image.star
        waitingLabel.text = nil
        categoryLabel.text = nil
        storeNameLabel.text = nil
        rateLabel.text = nil
        addressLabel.text = nil
        typeLabel.text = nil
    }
}

private enum Image {
    static let star = UIImage(named: "star")
}
