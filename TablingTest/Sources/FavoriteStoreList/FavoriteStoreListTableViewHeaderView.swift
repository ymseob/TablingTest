//
//  FavoriteStoreListTableViewHeaderView.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/14.
//

import UIKit

protocol FavoriteStoreListTableViewHeaderViewDelegate: AnyObject {
    func favoriteStoreListTableViewHeaderView(
        _ favoriteStoreListTableViewHeaderView: FavoriteStoreListTableViewHeaderView,
        didSelectType: FavoriteStoreListType
    )
}

final class FavoriteStoreListTableViewHeaderView: UITableViewHeaderFooterView {
    static let identifier = "FavoriteStoreListTableViewHeaderView"
    static let height: CGFloat = 44

    @IBOutlet private weak var savedLabel: UILabel!
    @IBOutlet private weak var recentlyLabel: UILabel!
    @IBOutlet private weak var bottomIndicatorView: UIView!
    @IBOutlet private weak var bottomIndicatorViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomIndicatorLeadingConstraint: NSLayoutConstraint!

    private let savedLabelTapGestureRecognizer = UITapGestureRecognizer()
    private let recentlyLabelTapGestureRecognizer = UITapGestureRecognizer()

    weak var delegate: FavoriteStoreListTableViewHeaderViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackgroundView()
        setupGestures()
    }

    private func setupBackgroundView() {
        backgroundView = {
            let view = UIView(frame: self.bounds)
            view.backgroundColor = .white
            return view
        }()
    }

    private func setupGestures() {
        savedLabel.addGestureRecognizer(savedLabelTapGestureRecognizer)
        savedLabelTapGestureRecognizer.addTarget(self, action: #selector(savedDidTap))

        recentlyLabel.addGestureRecognizer(recentlyLabelTapGestureRecognizer)
        recentlyLabelTapGestureRecognizer.addTarget(self, action: #selector(recentlyDidTap))
    }

    private func updateUI(to listType: FavoriteStoreListType, completion: @escaping () -> Void) {
        guard let willFoucusLabel = listType == .saved ? savedLabel : recentlyLabel else {
            return
        }

        let selected: UIColor = .black
        let deselected: UIColor = .lightGray
        savedLabel.textColor = willFoucusLabel == savedLabel ? selected : deselected
        recentlyLabel.textColor = willFoucusLabel == recentlyLabel ? selected : deselected

        let animator = UIViewPropertyAnimator(duration: 0.2, curve: .linear) {
            self.bottomIndicatorViewWidthConstraint.constant = willFoucusLabel.bounds.width
            self.bottomIndicatorLeadingConstraint.constant = willFoucusLabel.frame.origin.x
            self.layoutIfNeeded()
        }
        animator.addCompletion { _ in
            completion()
        }

        animator.startAnimation()
    }


    @objc
    private func savedDidTap() {
        updateUI(to: .saved) { [weak self] in
            guard let self = self else { return }
            self.delegate?.favoriteStoreListTableViewHeaderView(self, didSelectType: .saved)
        }
    }

    @objc
    private func recentlyDidTap() {
        updateUI(to: .recently) { [weak self] in
            guard let self = self else { return }
            self.delegate?.favoriteStoreListTableViewHeaderView(self, didSelectType: .recently)
        }
    }
}
