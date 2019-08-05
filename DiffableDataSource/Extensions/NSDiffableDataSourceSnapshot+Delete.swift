//
//  NSDiffableDataSourceSnapshot+Delete.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import UIKit

extension NSDiffableDataSourceSnapshot {
    
    func deleteItems(_ items: [ItemIdentifierType], at section: Int) {
        
        // a Delete Items in section
        deleteItems(items)
        // b Get the section Identifier
        let sectionIdentifier = sectionIdentifiers[section]
        // c Check if its empty
        guard numberOfItems(inSection: sectionIdentifier) == 0 else { return }
        // d Delete Section
        deleteSections([sectionIdentifier])
    }
    
    func isSectionEmpty(_ section: Int) -> Bool {
        let sectionIdentifier = sectionIdentifiers[section]
        return numberOfItems(inSection: sectionIdentifier) == 0
    }
}
