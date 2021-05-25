//
//  TableView+Additions.swift
//  baseArquitecture
//
//  Created by Ricardo Sanchez on 5/25/21.
//

import UIKit

extension UITableView {
    func registerCellNib(cell type: UITableViewCell.Type, bundle: Bundle? = nil) {
        let className = String(describing: type)
        register(UINib(nibName: className, bundle: bundle), forCellReuseIdentifier: className)
    }

    func registerCell(cell type: UITableViewCell.Type, bundle: Bundle? = nil) {
        let className = String(describing: type)
        register(type, forCellReuseIdentifier: className)
    }

    func dequeueReusableBy<T>(cell type: T.Type, indexPath: IndexPath) -> T {
        let identifier = String(describing: type)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
}
