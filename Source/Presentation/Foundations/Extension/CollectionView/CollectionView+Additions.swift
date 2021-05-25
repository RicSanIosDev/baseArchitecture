//
//  CollectionView+Additions.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

extension UICollectionView {
    func registerCellNib(cell type: UICollectionViewCell.Type, bundle: Bundle? = nil) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: bundle), forCellWithReuseIdentifier: className)
    }

    func registerCell(cell type: UICollectionViewCell.Type, bundle: Bundle? = nil) {
        let className = String(describing: type)
        register(type, forCellWithReuseIdentifier: className)
    }

    func dequeueReusableBy<T>(cell type: T.Type, indexPath: IndexPath) -> T {
        let identifier = String(describing: type)
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
}
