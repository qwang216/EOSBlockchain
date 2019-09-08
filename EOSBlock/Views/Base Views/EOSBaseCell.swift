//
//  EOSBaseCell.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class EOSBaseCell: UITableViewCell, Identifiable {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    func setupView() {}

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
