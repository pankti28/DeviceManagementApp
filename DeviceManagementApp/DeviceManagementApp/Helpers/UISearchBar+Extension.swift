//
//  UISearchBar+Extension.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-27.
//

import Foundation
import UIKit

extension UISearchBar {
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else {
            // Fallback on earlier versions
            return value(forKey: "_searchField") as? UITextField
        }
    }
    
    func change(textFont: UIFont?) {
        if let textField = self.textField {
            textField.font = textFont
        }
    }
}
