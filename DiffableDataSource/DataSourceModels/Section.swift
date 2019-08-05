//
//  Section.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

struct Section<U: Hashable, T: Hashable>: Hashable {
    let headerItem: U
    let items: T
}
