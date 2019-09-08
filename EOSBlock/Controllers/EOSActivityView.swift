//
//  EOSActivityView.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class EOSActivityView: UIActivityIndicatorView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        style = .whiteLarge
        backgroundColor = .lightGray
        layer.cornerRadius = 5
        alpha = 0.7
        hidesWhenStopped = true
        anchor(size: .init(width: 70, height: 70))
    }

}
