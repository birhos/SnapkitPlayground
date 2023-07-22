//
//  PaddingViewController.swift
//  SnapkitPlayground
//
//  Created by Haydar Demir on 22.07.2023.
//

import UIKit
import SnapKit

/*
    There are a few differences to add padding for top, bottom, leading, and trailing.
        1) For top and leading padding, the value of the offset always greater than 0.
        2) For trailing and bottom padding, it is always less than 0.
*/

class PaddingViewController: UIViewController {
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
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalToSuperview().offset(40)
        }
        
        // MARK: top-right
        greenSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        // MARK: bottom-left
        blueSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
            make.leading.equalToSuperview().offset(40)
        }
        
        // MARK: bottom-right
        yellowSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        // MARK: center
        orangeSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.center.equalToSuperview()
        }
        
        // MARK: Leading and trailing with inset()
        /*
        // Instead of this
        orangeSquareView.snp.makeConstraints { make in
            make.height.equalTo(boxWidth)
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
         
        // use this
        orangeSquareView.snp.makeConstraints { make in
            make.height.equalTo(boxWidth)
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
        }
        */
    }
}
