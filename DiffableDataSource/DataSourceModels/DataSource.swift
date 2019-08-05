//
//  DataSource.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

struct DataSource<T: Hashable> {
    let sections: [T]
}
