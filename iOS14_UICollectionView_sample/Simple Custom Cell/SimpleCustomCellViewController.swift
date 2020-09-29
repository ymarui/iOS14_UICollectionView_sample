//
//  SimpleCustomCellViewController.swift
//  sample
//
//  Created by y.marui on 2020/10/06.
//  Copyright © 2020 y.marui. All rights reserved.
//

import UIKit

class SimpleCustomCellViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    enum Section: CaseIterable {
        case kanto
        case kyusyu
    }
    
    let data: [Section: [String]] = [
        .kanto: ["Kanto", "Tokyo", "Chiba"],
        .kyusyu: ["Kyusyu", "Fukuoka", "Miyazaki"]
    ]

    var collectionViewDataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var layoutConfig = UICollectionLayoutListConfiguration(appearance: .grouped)
        layoutConfig.headerMode = UICollectionLayoutListConfiguration.HeaderMode.firstItemInSection

        let layout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        collectionView.collectionViewLayout = layout
        
        collectionViewDataSource = createDataSource()
        reloadList()
    }

    func createDataSource() -> UICollectionViewDiffableDataSource<Section, String> {
        
        let normalCell = UICollectionView.CellRegistration<UICollectionViewListCell, String> { (cell, indexPath, text) in
            var content = cell.defaultContentConfiguration()
            content.text = text
            cell.contentConfiguration = content
        }
        
        let customCell = UICollectionView.CellRegistration<SimpleCustomCell, String> { (cell, indexPath, text) in
            cell.title = text
        }
        
        return UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView) {
            (collectionView, indexPath, text) -> UICollectionViewCell? in
     
            // セクションタイトルには、通常のセルを使っています。
            if indexPath.row == 0 {
                return collectionView.dequeueConfiguredReusableCell(using: normalCell, for: indexPath, item: text)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: customCell, for: indexPath, item: text)
            }
        }
    }
    
    func reloadList(){
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(data[.kanto]!, toSection: .kanto)
        snapshot.appendItems(data[.kyusyu]!, toSection: .kyusyu)
        collectionViewDataSource.apply(snapshot)
    }
}
