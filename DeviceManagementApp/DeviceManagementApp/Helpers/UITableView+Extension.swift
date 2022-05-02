//
//  UITableView+Extension.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-25.
//

import Foundation
import UIKit

extension UITableView {
    /// Register cell with automatically setting Identifier
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    func dequeueCell<T>(cell: T.Type) -> T? where T: UITableViewCell {
        return dequeueReusableCell(withIdentifier: cell.reuseIdentifier) as? T
    }
    
}

extension UITableView {
    /// Hides the empty cells at the bottom of the table view.
    func hideEmptyCellsFooter() {
        tableFooterView = UIView()
    }
}

extension UITableViewCell: Reusable { }
