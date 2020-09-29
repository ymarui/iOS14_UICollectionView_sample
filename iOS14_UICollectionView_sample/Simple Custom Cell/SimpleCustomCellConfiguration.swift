//
//  SimpleCustomCellConfiguration.swift
//  sample
//
//  Created by y.marui on 2020/10/08.
//  Copyright © 2020 y.marui. All rights reserved.
//

import UIKit

struct SimpleCustomCellConfiguration: UIContentConfiguration, Hashable {

    var title: String?
    
    func makeContentView() -> UIView & UIContentView {
        return SimpleCustomCellView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> Self {
        return self
    }
}
