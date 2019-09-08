//
//  EOSBlockCell.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class EOSBlockCell: EOSBaseCell, ReusesableView {

    let blockLabel: UILabel = {
        let lb = UILabel(frame: .zero)
        lb.text = "Block Number 12345"
        lb.textAlignment = .left
        return lb
    }()

    override func setupView() {
        super.setupView()
        contentView.addSubview(blockLabel)
        blockLabel.fillToSuperview()
    }

    func configCell(_ item: String) {
        blockLabel.text = item
    }

}
