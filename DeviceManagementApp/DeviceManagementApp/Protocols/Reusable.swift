//
//  Reusable.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-25.
//

import Foundation

typealias ReuseIdentifier = String

/// A protocol defining a reusable view type
protocol Reusable {
    /// Returns default reuseIdentifier for this content type.
    static var reuseIdentifier: ReuseIdentifier { get }
}

extension Reusable {
    static var reuseIdentifier: ReuseIdentifier {
        return String(describing: self)
    }
}
