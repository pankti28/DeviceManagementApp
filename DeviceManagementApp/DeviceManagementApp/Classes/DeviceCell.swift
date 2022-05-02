//
//  DeviceCell.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-25.
//

import Foundation
import UIKit

class DeviceCell: UITableViewCell{
    
    let cardView = CardView().apply {
        $0.backgroundColor = AppColors.accent
    }

    let deviceImageView = UIImageView().apply {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }

    let deviceTitleLabel = UILabel().apply {
        $0.text = ""
        $0.font = AppFonts.system17
        $0.textColor =  UIColor.darkText
        $0.backgroundColor = UIColor.clear
        $0.numberOfLines = 0
        $0.clipsToBounds = true
    }
 
    let deviceInfoImageView = UIImageView().apply {
        $0.image = AppImages.info.withTintColor(AppColors.primary)
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        ConfigureCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension DeviceCell{
    private func ConfigureCell(){
        backgroundColor = .white
        selectionStyle = .none
        
        setUpCardView()
        setUpDeviceImageView()
        setUpDeviceTitleLabel()
        setUpDeviceInfoImageView()
    }
    
    private func setUpCardView(){
        guard cardView.superview == nil else { return }
        contentView.addSubview(cardView)
        cardView.prepareForLayout()
        
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8).isActive = true
        cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
    
    private func setUpDeviceImageView(){
        guard deviceImageView.superview == nil else { return }
        cardView.addSubview(deviceImageView)
        deviceImageView.prepareForLayout()
        
        deviceImageView.topAnchor.constraint(equalTo: cardView.topAnchor,constant: 10).isActive = true
        deviceImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor,constant: 8).isActive = true
        deviceImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        deviceImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deviceImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor,constant: -10).isActive = true
    }
        
    private func setUpDeviceTitleLabel(){
        guard deviceTitleLabel.superview == nil else { return }
        cardView.addSubview(deviceTitleLabel)
        deviceTitleLabel.prepareForLayout()
        
        deviceTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor,constant: 10).isActive = true
        deviceTitleLabel.leadingAnchor.constraint(equalTo: deviceImageView.trailingAnchor,constant: 10).isActive = true
        deviceTitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -5).isActive = true
        deviceTitleLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor,constant: -10).isActive = true
    }
    
    private func setUpDeviceInfoImageView(){
        guard deviceInfoImageView.superview == nil else { return }
        cardView.addSubview(deviceInfoImageView)
        deviceInfoImageView.prepareForLayout()
        
        deviceInfoImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor,constant: -10).isActive = true
        deviceInfoImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        deviceInfoImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        deviceInfoImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}

extension DeviceCell {
    func display(device: Device){
        deviceTitleLabel.text = device.title
        switch device.type {
        case .Sensor:
            deviceImageView.image = AppImages.sensor
        case .Thermostat:
            deviceImageView.image = AppImages.thermostat
        case .Transmitter:
            deviceImageView.image = AppImages.wirelessTransmitter
        case .Receiver:
            deviceImageView.image = AppImages.wirelessReceiver
        }
    }
}

class CardView: UIView {
    let cornerRadius: CGFloat = 4.0
    let shadowColor: CGColor = UIColor.gray.cgColor
    let shadowOffsetWidth: CGFloat = 0.0
    let shadowOffsetHeight: CGFloat = 0.0
    let shadowOpacity: Float = 0.1

    override func layoutSubviews() {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        self.layer.shadowOpacity = shadowOpacity
    }
}
