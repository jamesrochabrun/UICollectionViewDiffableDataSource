//
//  NewContentCell.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: BaseCollectionViewCell<Film> {
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func sharedInit() {
        
        contentView.addSubview(movieTitleLabel)
        movieTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        movieTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    override func configureCell(with item: Film) {
        movieTitleLabel.text = item.title
    }
}

class MovieCellRed: BaseCollectionViewCell<Film> {
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func sharedInit() {
        
        contentView.addSubview(movieTitleLabel)
        movieTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        movieTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    override func configureCell(with item: Film) {
        movieTitleLabel.text = item.title
    }
}
