//
//  UIView+Extension.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-25.
//

import Foundation
import UIKit

protocol Constrainable {
    @discardableResult
    func prepareForLayout() -> Self
}


extension UIView: Constrainable {
    
    @discardableResult
    public func prepareForLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
