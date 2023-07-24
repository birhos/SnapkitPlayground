//
//  Demo4ViewController.swift
//  SnapkitPlayground
//
//  Created by Haydar Demir on 24.07.2023.
//

import Kingfisher
import SnapKit
import UIKit

class Demo4ViewController: UIViewController {
    private let images: [String] = [
        "https://images.pexels.com/photos/17586064/pexels-photo-17586064/free-photo-of-cesta-baloncesto.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/12665570/pexels-photo-12665570.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
        "https://images.pexels.com/photos/14420907/pexels-photo-14420907.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/16899839/pexels-photo-16899839/free-photo-of-man-portrait-near-rocks.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/14975231/pexels-photo-14975231/free-photo-of-stained-glass-windows-inside-old-stone-abbey.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/17687878/pexels-photo-17687878/free-photo-of-natalia-machado.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/17525436/pexels-photo-17525436/free-photo-of-mother-lying-down-and-hugging-daughter-on-bed.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/14918400/pexels-photo-14918400.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/16999028/pexels-photo-16999028/free-photo-of-young-brunette-wearing-a-checkered-coat-and-red-beret-and-standing-in-front-of-a-building.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/13931586/pexels-photo-13931586.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/17661756/pexels-photo-17661756/free-photo-of-festival-high-ferris-wheel-blue-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/16381770/pexels-photo-16381770/free-photo-of-portrait-of-woman-standing-and-thinking.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/16251652/pexels-photo-16251652/free-photo-of-lighthouse-in-town-at-night.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/17666499/pexels-photo-17666499/free-photo-of-danzas-de-pacuartambo.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/13096925/pexels-photo-13096925.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load",
        "https://images.pexels.com/photos/16855802/pexels-photo-16855802/free-photo-of-ready-to-eat-cake-on-a-cakestand.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/16683264/pexels-photo-16683264/free-photo-of-woman-swinging-on-a-tree-swing.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/17535285/pexels-photo-17535285/free-photo-of-woman-in-dress-standing-among-plants.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/15281188/pexels-photo-15281188/free-photo-of-view-of-venice-city-and-canal.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "https://images.pexels.com/photos/17654694/pexels-photo-17654694/free-photo-of-espiral.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load"
    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0 // horizontal
        layout.minimumLineSpacing = 10 // vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: (view.frame.width - 30) / 2, height: ((view.frame.width - 30) / 2) * 1.25)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
    }

    func setupView() {
        view.backgroundColor = .red
        view.addSubview(collectionView)
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(Demo4CollectionViewCell.self, forCellWithReuseIdentifier: Demo4CollectionViewCell.identifier)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - CollectionView Delegates

extension Demo4ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Demo4CollectionViewCell.identifier, for: indexPath) as? Demo4CollectionViewCell else { return UICollectionViewCell() }
        cell.configure(imageUrl: images[indexPath.row])
        return cell
    }
}

class Demo4CollectionViewCell: UICollectionViewCell {
    static let identifier: String = "Demo4CollectionViewCell"

    var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        imageView = UIImageView()
        contentView.addSubview(imageView)
        
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(imageUrl: String) {
        imageView.kf.setImage(with: URL(string: imageUrl), options: [.transition(.fade(0.3)), .cacheOriginalImage])
    }
}
