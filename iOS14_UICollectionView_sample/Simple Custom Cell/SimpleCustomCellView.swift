//
//  SimpleCustomCellView.swift
//  sample
//
//  Created by y.marui on 2020/10/06.
//  Copyright © 2020 y.marui. All rights reserved.
//

import UIKit

class SimpleCustomCellView: UIView, UIContentView {
    
    @IBOutlet var nameLabel: UILabel!

    var configuration: UIContentConfiguration
    
    init(configuration: SimpleCustomCellConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        loadNib()
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadNib() {
        let nib = UINib(nibName: "\(SimpleCustomCellView.self)", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = frame
        addSubview(view)
    }
    
    private func setUpUI() {
        guard let configuration = configuration as? SimpleCustomCellConfiguration else { return }
        nameLabel.text = configuration.title
    }
}
