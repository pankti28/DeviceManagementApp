//
//  DeviceDetailVC+UI.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-27.
//

import Foundation
import UIKit

extension DeviceDetailVC {
    func setUpHeaderView(){
        guard headerView.superview == nil else { return }
        headerView.prepareForLayout()
        view.addSubview(headerView)
        
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.2).isActive = true
    }
    
    func setUpBackButton() {
        guard backButton.superview == nil else { return }
        backButton.prepareForLayout()
        headerView.addSubview(backButton)
        
        backButton.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: -105).isActive = true
        backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 20).isActive = true
    }
    
    func setUpTitleLabel() {
        guard titleLabel.superview == nil else { return }
        titleLabel.prepareForLayout()
        headerView.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: -105).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 55).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: -25).isActive = true
    }
    
    func setUpTypeLabel() {
        guard typeLabel.superview == nil else { return }
        typeLabel.prepareForLayout()
        headerView.addSubview(typeLabel)
        
        typeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 55).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor,constant: -25).isActive = true
    }
    
    func setUpDeviceImgView(){
        guard deviceImgView.superview == nil else { return }
        deviceImgView.prepareForLayout()
        view.addSubview(deviceImgView)
        
        deviceImgView.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 20).isActive = true
        deviceImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deviceImgView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        deviceImgView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setUpDescriptionLabel(){
        guard descriptionLabel.superview == nil else { return }
        descriptionLabel.prepareForLayout()
        view.addSubview(descriptionLabel)
        
        descriptionLabel.topAnchor.constraint(equalTo: deviceImgView.bottomAnchor,constant: 15).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25).isActive = true
    }
}
