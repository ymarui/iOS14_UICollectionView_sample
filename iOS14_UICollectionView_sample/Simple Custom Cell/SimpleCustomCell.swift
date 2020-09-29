//
//  SimpleCustomCell.swift
//  sample
//
//  Created by y.marui on 2020/10/06.
//  Copyright © 2020 y.marui. All rights reserved.
//

import UIKit

class SimpleCustomCell: UICollectionViewListCell {

    var title: String!

    override func updateConfiguration(using state: UICellConfigurationState) {
        var newConfiguration = SimpleCustomCellConfiguration()
        newConfiguration.title = title
        contentConfiguration = newConfiguration
    }
}
