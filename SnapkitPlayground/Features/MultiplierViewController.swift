//
//  MultiplierViewController.swift
//  SnapkitPlayground
//
//  Created by Haydar Demir on 22.07.2023.
//

import UIKit
import SnapKit

class MultiplierViewController: UIViewController {
    private lazy var redSquareView: UIView = .init()
    private lazy var greenSquareView: UIView = .init()
    
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
        
        view.addSubviews(redSquareView, greenSquareView)
    }

    private func makeConstraints() {
        // center-left (width = 0.5 of superview)
        redSquareView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(80)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        // center-right
        greenSquareView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(80)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
