//
//  Extensions.swift
//  SnapkitPlayground
//
//  Created by Haydar Demir on 22.07.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
