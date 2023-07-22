//
//  Demo2ViewController.swift
//  SnapkitPlayground
//
//  Created by Haydar Demir on 22.07.2023.
//

import SnapKit
import UIKit
import Kingfisher

/// Fixed Height Card
final class Demo2ViewController: UIViewController {
    private let imageUrl: String = "https://images.pexels.com/photos/17044199/pexels-photo-17044199/free-photo-of-kids-looking-through-a-tire-swing.jpeg"
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#EEEEEE")
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
        label.text = "Jorge García"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eu porttitor magna, in dignissim ante. Integer vehicula maximus est id porta. Sed venenatis mauris turpis, vitae mollis augue efficitur et. Ut eget ligula eget tortor posuere condimentum sit amet ut augue. Duis elit est, ultrices vitae lorem vitae, sodales consequat sapien."
        label.textColor = .black
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
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
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.centerY.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.top.equalToSuperview().inset(12)
            make.left.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.left.equalTo(imageView.snp_rightMargin).offset(12)
            make.right.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(12)
            make.left.equalTo(imageView.snp_rightMargin).offset(12)
            make.right.equalToSuperview()
        }
    }
}

extension UIColor {
    convenience init?(hexString: String) {
        var formattedString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if formattedString.hasPrefix("#") {
            formattedString.remove(at: formattedString.startIndex)
        }

        if formattedString.count != 6 {
            return nil
        }

        var rgbValue: UInt64 = 0
        Scanner(string: formattedString).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
