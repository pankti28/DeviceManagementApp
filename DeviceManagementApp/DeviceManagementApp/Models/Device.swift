//
//  Device.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-25.
//

import Foundation

struct Device: Codable,Equatable {
    var id: String
    var type: DeviceType = .Sensor
    var price: Int
    var currency: String
    var isFavourite: Bool = false
    var imageURL: String
    var title: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case price
        case currency
        case isFavourite
        case imageURL
        case title
        case description
    }
}

enum DeviceType: String, Codable {
    case Sensor
    case Thermostat
    case Transmitter
    case Receiver
}

extension Device: SearchableData {
    var searchValue: String {
        return self.title +  " " + self.type.rawValue
    }
}

//Mock data
extension Device {
    static let temperatureSensor = Device(id: "1234", type: .Sensor, price: 20, currency: "USD", isFavourite: false, imageURL: "", title: "Temprature Sensor", description: "One of the most common and most popular sensors is the Temperature Sensor.\n\nA Temperature Sensor, as the name suggests, senses the temperature \n\ni.e., it measures the changes in the temperature.")
    static let thermostate = Device(id: "1235", type: .Thermostat, price: 25, currency: "USD", isFavourite: true, imageURL: "", title: "Test Thermostat", description: "")
    static let transmitter = Device(id: "1236", type: .Transmitter, price: 15, currency: "CAD", isFavourite: true, imageURL: "", title: "Test Transmitter", description: "")
    static let receiver = Device(id: "1237", type: .Receiver, price: 40, currency: "USD", isFavourite: true, imageURL: "", title: "Test Receiver", description: "")
    static let touchSensor = Device(id: "1234", type: .Sensor, price: 20, currency: "USD", isFavourite: false, imageURL: "", title: "Touch Sensor", description: "")
    static let proximitySensor = Device(id: "1234", type: .Sensor, price: 20, currency: "USD", isFavourite: false, imageURL: "", title: "Proximity Sensor", description: "")
}
