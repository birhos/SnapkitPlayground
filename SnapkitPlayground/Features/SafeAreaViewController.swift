//
//  SafeAreaViewController.swift
//  SnapkitPlayground
//
//  Created by Haydar Demir on 22.07.2023.
//

import UIKit
import SnapKit

class SafeAreaViewController: UIViewController {
    private lazy var redSquareView: UIView = .init()
    private lazy var greenSquareView: UIView = .init()
    private lazy var blueSquareView: UIView = .init()
    private lazy var yellowSquareView: UIView = .init()
    private lazy var orangeSquareView: UIView = .init()
    
    let boxWidth: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        redSquareView.backgroundColor = .red
        greenSquareView.backgroundColor = .green
        blueSquareView.backgroundColor = .blue
        yellowSquareView.backgroundColor = .yellow
        orangeSquareView.backgroundColor = .orange
        
        view.addSubviews(redSquareView, greenSquareView, blueSquareView, yellowSquareView, orangeSquareView)
    }

    private func makeConstraints() {
        // MARK: top-left
        redSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
        }
        
        // MARK: top-right
        greenSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalToSuperview()
        }
        
        // MARK: bottom-left
        blueSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview()
        }
        
        // MARK: bottom-right
        yellowSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.trailing.equalToSuperview()
        }
        
        // MARK: center
        orangeSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.center.equalToSuperview()
        }
    }
}
