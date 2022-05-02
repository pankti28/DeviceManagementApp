//
//  HomeViewModel.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-25.
//

import Foundation

class HomeViewModel: NSObject {
    
    var repository: DeviceRepository?
    var deviceList: Dynamic<[Device]> = Dynamic([])

    let isLoading = Dynamic<Bool>(false)
    var errorMessage: Dynamic<String?> = Dynamic(nil)
    var error: Dynamic<Bool> = Dynamic(false)
    
    init(repository: DeviceRepository = DeviceRepository()) {
        super.init()
        self.repository = repository
        fetchDevices()
    }
    
    //MARK:- API CALL
    func fetchDevices() {
        self.isLoading.value = true
        self.repository?.fetchDeviceList(completion: { deviceList, error in
            self.isLoading.value = false
            if error != nil {
                self.setError(error?.description ?? "Unknown Error")
            } else{
                self.deviceList.value = deviceList ?? []
            }
        })
    }
    
    func setError(_ message: String) {
        self.errorMessage.value = message
        self.error.value = true
    }
}

extension HomeViewModel {
    var hasDevices: Bool {
        return !deviceList.value.isEmpty
    }
}
