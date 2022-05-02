//
//  Appliable.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-25.
//

import Foundation

protocol Appliable {}

extension Appliable {
    @discardableResult
     func apply(closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: Appliable {}
