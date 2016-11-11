//
//  HorizontalSlideTableViewCell.swift
//  SideScrollCells
//
//  Created by Daniel Oram on 9/11/16.
//  Copyright © 2016 Daniel Oram. All rights reserved.
//

import UIKit

class HorizontalSlideTableViewCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    //computed value for remembering content offset of collectionview
    
    var collectionViewOffset: CGFloat {
        get {
            return collectionView.contentOffset.x
        }
        
        set {
            collectionView.contentOffset.x = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }

}
