//
//  Demo1ViewController.swift
//  SnapkitPlayground
//
//  Created by Haydar Demir on 22.07.2023.
//

import Kingfisher
import SnapKit
import UIKit

class Demo1ViewController: UIViewController {
    let imageWidth: CGFloat = 100

    private let imageUrl: String = "https://img.freepik.com/premium-vector/social-avatar-stories-gradient-frame_41737-3.jpg?w=1800"

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()

    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageWidth / 2
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "John Smith"
        return label
    }()

    lazy var roleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.text = "IOS Engineer"
        return label
    }()

    lazy var nameStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, roleLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.numberOfLines = 0
        label.text = "SnapKit is a DSL to make Auto Layout easy on both iOS and OS X. Simple & Expressive chaining DSL allows building constraints with minimal amounts of code while ensuring they are easy to read and understand. \n\nType Safe by design to reduce programmer error and keep invalid constraints from being created in the first place for maximized productivity. Compatible for both iOS and OS X apps installable through Cocoapods or Carthage.Free to use in all projects and licensed under the flexible MIT license."
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        view.backgroundColor = .white

        view.addSubview(titleLabel)
        view.addSubview(profileImageView)
        view.addSubview(nameStackView)
        view.addSubview(descriptionLabel)

        profileImageView.kf.setImage(with: URL(string: imageUrl), options: [.transition(.fade(0.3)), .cacheOriginalImage])

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(imageWidth)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
        }

        nameStackView.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(12)
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
