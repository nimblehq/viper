//
//  RepoViewController.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

// sourcery: AutoMockable
protocol RepoViewInput: AnyObject {
    func configure()
    func showViewItem(_ item: RepoItem)
    func showAvatar(_ data: Data)
    func enableRightBarButton(_ isEnable: Bool)
}

// sourcery: AutoMockable
protocol RepoViewOutput: AnyObject {
    func viewDidLoad()
    func openWebPage()
    func bookmarkRepo()
}

final class RepoViewController: UIViewController {

    // MARK: - Outlets
    var backButton: UIBarButtonItem?
    var bookmarkButton: UIBarButtonItem?
    let repoNameLabel = UILabel()
    let descriptionLabel = UILabel()

    let authorViewTitle = UILabel()
    let authorView = UIView()
    let avatarImageView = UIImageView()
    let authorNameLabel = UILabel()
    var isEnableBookmark: Bool = true
    
    var output: RepoViewOutput?

    override func viewDidLoad() { 
        super.viewDidLoad()
        output?.viewDidLoad()
    }
}

// MARK: - RepoViewInput
extension RepoViewController: RepoViewInput {
    func configure() {
        setupUI()
    }
    
    func showViewItem(_ item: RepoItem) {
        navigationItem.title = item.repoFullName
        repoNameLabel.text = item.repoName
        descriptionLabel.text = item.description
        authorViewTitle.text = "@author"
        authorNameLabel.text = item.authorName
    }

    func showAvatar(_ data: Data) {
        avatarImageView.image = UIImage(data: data)
    }

    func enableRightBarButton(_ isEnable: Bool) {
        isEnableBookmark = isEnable
        navigationItem.rightBarButtonItem?.isEnabled = isEnableBookmark
    }
}

// MARK: - UI
extension RepoViewController {
    private func setupUI() {
        setUpLayouts()
        setUpViews()
        setUpIdentifier()
    }

    private func setUpLayouts() {
        view.addSubview(repoNameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(authorViewTitle)
        view.addSubview(authorView)
        authorView.addSubview(avatarImageView)
        authorView.addSubview(authorNameLabel)

        repoNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.layoutMarginsGuide).inset(20.0)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(repoNameLabel.snp.bottom).inset(-20.0)
            $0.left.right.equalToSuperview().inset(8.0)
        }

        authorViewTitle.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).inset(-20.0)
            $0.left.equalToSuperview().inset(8.0)
        }

        authorView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(8.0)
            $0.top.equalTo(authorViewTitle.snp.bottom).inset(-20.0)
            $0.height.equalTo(80.0)
        }

        avatarImageView.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview()
            $0.width.equalTo(avatarImageView.snp.height)
        }

        authorNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(8.0)
            $0.left.equalTo(avatarImageView.snp.right).inset(-8.0)
        }
    }

    private func setUpViews() {
        view.backgroundColor = .white

        let backButton = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        self.backButton = backButton
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        let bookmarkButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(didTapBookmark))
        self.bookmarkButton = bookmarkButton
        navigationItem.rightBarButtonItem = bookmarkButton
        navigationItem.rightBarButtonItem?.isEnabled = isEnableBookmark

        repoNameLabel.font = .boldSystemFont(ofSize: 19.0)
        descriptionLabel.numberOfLines = 0

        authorViewTitle.font = .boldSystemFont(ofSize: 17.0)

        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOwner))
        authorView.addGestureRecognizer(tap)

        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2
        avatarImageView.layer.masksToBounds = true
    }

    private func setUpIdentifier() {
        setIdentifiersForViews(with: [
            General.backButton.identifier: backButton,
            General.bookmarkButton.identifier: bookmarkButton,
            DetailRepo.view.identifier: view,
            DetailRepo.repoNameLabel.identifier: repoNameLabel,
            DetailRepo.descriptionLabel.identifier: descriptionLabel,
            DetailRepo.authorView.identifier: authorView,
            DetailRepo.authorViewTitle.identifier: authorViewTitle,
            DetailRepo.authorNameLabel.identifier: authorNameLabel,
            DetailRepo.avatarImageView.identifier: avatarImageView
        ])
    }
}

// MARK: - Actions
extension RepoViewController {
    @objc private func didTapOwner(_ sender: Any) {
        output?.openWebPage()
    }

    @objc private func didTapBookmark(_ sender: Any) {
        output?.bookmarkRepo()
    }
}
