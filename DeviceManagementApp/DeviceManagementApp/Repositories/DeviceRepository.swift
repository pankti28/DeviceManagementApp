//
//  DeviceRepository.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-27.
//

import Foundation

class DeviceRepository {
    
    func fetchDeviceList(completion:@escaping ([Device]?, String?) -> Void){
        let deviceList = [
            Device.temperatureSensor,
            Device.thermostate,
            Device.transmitter,
            Device.receiver]
           completion(deviceList.self, nil)
    }
}
