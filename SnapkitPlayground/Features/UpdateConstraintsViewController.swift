//
//  UpdateConstraintsViewController.swift
//  SnapkitPlayground
//
//  Created by Haydar Demir on 22.07.2023.
//

import UIKit
import SnapKit

class UpdateConstraintsViewController: UIViewController {
    private lazy var redSquareView: UIView = .init()
    
    let boxWidth: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        makeConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        redSquareView.backgroundColor = .red
        
        view.addSubviews(redSquareView)
    }

    private func makeConstraints() {
        // MARK: top-left
        redSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(40)
        }
        
        // ensures that all pending layout operations complete
        self.view.layoutIfNeeded()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIView.animate(withDuration: 0.5, delay: 1.0) {
                self.redSquareView.snp.updateConstraints { make in
                    make.top.equalToSuperview().offset(200)
                }
                // trigger layout update
                self.view.layoutIfNeeded()
            }
        }
    }
}
