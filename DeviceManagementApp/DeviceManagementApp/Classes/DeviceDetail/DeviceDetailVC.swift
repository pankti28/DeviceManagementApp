//
//  DeviceDetailVC.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-27.
//

import Foundation
import UIKit

class DeviceDetailVC: UIViewController {
    
    var device: Device?
    
    var headerView = UIView().apply {
        $0.clipsToBounds = true
        $0.backgroundColor = AppColors.primary
    }
    
    var backButton = UIButton().apply {
        $0.clipsToBounds = true
        $0.setImage(AppImages.back, for: .normal)
        $0.addTarget(self, action: #selector(backTapped(_:)), for: .touchUpInside)
    }
    
    var titleLabel = UILabel().apply {
        $0.textColor = UIColor.orange
        $0.font = AppFonts.system25SemiBold
    }
    
    var typeLabel = UILabel().apply {
        $0.textColor = .white
    }
    
    var deviceImgView = UIImageView().apply {
        $0.contentMode = .scaleAspectFit
    }
    
    var descriptionLabel = UILabel().apply {
        $0.textColor = .black
        $0.numberOfLines = 0
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        bindData()
    }
    
    func setUpUI() {
        view.backgroundColor = AppColors.accent
        self.navigationController?.navigationBar.isHidden = true
        setUpHeaderView()
        setUpBackButton()
        setUpTitleLabel()
        setUpTypeLabel()
        setUpDeviceImgView()
        setUpDescriptionLabel()
    }
    
}

extension DeviceDetailVC {
    func bindData() {
        titleLabel.text = device?.title
        typeLabel.attributedText = NSMutableAttributedString()
            .appendWith(color: .white, weight: .medium,ofSize: 20, "Type:")
                    .appendWith(" ")
                    .appendWith(color: .white, weight: .regular,ofSize: 17, String(describing: device?.type.rawValue ?? " "))
        
        switch device?.type {
        case .Sensor:
            deviceImgView.image = AppImages.sensor
        case .Thermostat:
            deviceImgView.image = AppImages.thermostat
        case .Transmitter:
            deviceImgView.image = AppImages.wirelessTransmitter
        case .Receiver:
            deviceImgView.image = AppImages.wirelessReceiver
        case .none:
            break
        }
        descriptionLabel.text = device?.description
    }
    
    @objc func backTapped(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
