//
//  Demo2ViewController.swift
//  SnapkitPlayground
//
//  Created by Haydar Demir on 22.07.2023.
//

import Kingfisher
import SnapKit
import UIKit

/// Dynamic Height Card
final class Demo3ViewController: UIViewController {
    private let imageUrl: String = "https://images.pexels.com/photos/17044199/pexels-photo-17044199/free-photo-of-kids-looking-through-a-tire-swing.jpeg"

    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#EEEEEE")
        view.layer.cornerRadius = 10.0
        return view
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Başlık"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bu bir örnek açıklama"
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        view.backgroundColor = .white

        view.addSubviews(cardView)
        cardView.addSubviews(imageView, titleLabel, subTitleLabel)

        imageView.kf.setImage(with: URL(string: imageUrl), options: [.transition(.fade(0.3)), .cacheOriginalImage])

        cardView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }

        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(240)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }

        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}
