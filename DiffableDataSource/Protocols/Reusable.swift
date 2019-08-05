//
//  Reusable.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import UIKit

protocol CollectionReusable {}

/// MARK:- UITableView

extension CollectionReusable where Self: UITableViewCell  {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: CollectionReusable {}

extension UITableView {
    
    /// Register Programatic Cell
    func register<T: UITableViewCell>(_ :T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Register Xib cell
    func registerNib<T: UITableViewCell>(_ :T.Type, in bundle: Bundle? = nil) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as! T
        return cell
    }
    
    func registerNibFooterOrHeader<T: UITableViewHeaderFooterView>(_ : T.Type, in bundle: Bundle? = nil) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerFooterOrHeader<T: UITableViewHeaderFooterView>(_ : T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueHeaderOrFooter<T: UITableViewHeaderFooterView>() -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
    }
}

/// MARK:- UICollectionView

extension CollectionReusable where Self: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    
    /// Register Programatic Cell
    func register<T: UICollectionViewCell>(_ :T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Register Xib cell
    func registerNib<T: UICollectionViewCell>(_ :T.Type, in bundle: Bundle? = nil) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
        return cell
    }
    
    /// Register Programatic Header
    func registerHeader<T: UICollectionReusableView>(_ :T.Type, kind: String) {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Register Xib Header
    
    func registerNibHeader<T: UICollectionReusableView>(_ : T.Type, kind: String, in bundle: Bundle? = nil) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueSuplementaryView<T: UICollectionReusableView>(of kind: String, at indexPath: IndexPath) -> T {
        let supplementaryView = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
        return supplementaryView
    }
    
    func cellForItem<T: UICollectionViewCell>(at indexPath: IndexPath) -> T {
        return cellForItem(at: indexPath) as! T
    }
}



/// MARK:- UICollectionView

extension CollectionReusable where Self: UICollectionReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: CollectionReusable {}

/// MARK:- TableView

extension CollectionReusable where Self: UITableViewHeaderFooterView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView: CollectionReusable {}
