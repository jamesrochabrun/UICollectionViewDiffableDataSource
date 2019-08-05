//
//  BaseCollectionViewCell.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionViewCell<V>: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    var item: V? {
        didSet {
            guard let item = item else { return }
            configureCell(with: item)
        }
    }
    
    // To be overriden.
    public func sharedInit() {
        // UI Set Up
    }
    
    public func configureCell(with item: V) {
        // configuration Set Up
    }
}
