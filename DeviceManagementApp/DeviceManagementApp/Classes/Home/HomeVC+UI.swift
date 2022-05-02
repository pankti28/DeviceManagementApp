//
//  HomeVC+UI.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-25.
//

import Foundation
import UIKit

extension HomeVC {
    func setUpNavigationBar() {
        self.title = AppStrings.devices
        let settingButton = UIBarButtonItem(image: AppImages.settings, style: .plain, target: self, action: #selector(settingTapped(_:)))
        settingButton.tintColor = .black
        navigationItem.rightBarButtonItem = settingButton
    }
    
    func setUpDeviceListView(){
        guard deviceListView.superview == nil else { return }
        deviceListView.prepareForLayout()
        view.addSubview(deviceListView)
        
        deviceListView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        deviceListView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        deviceListView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        deviceListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        deviceListView.register(DeviceCell.self)
        deviceListView.delegate = self
        deviceListView.dataSource = self
    }
    
    func setUpSearchbar() {
        deviceListView.tableHeaderView = self.searchbar
        if let textfield = searchbar.textField {
            let atrString = NSAttributedString(string: AppStrings.search,
                                               attributes: [.foregroundColor: UIColor.lightGray,
                                                .font: UIFont.systemFont(ofSize: 18, weight: .medium)])
             textfield.attributedPlaceholder = atrString
        }
    }
}
