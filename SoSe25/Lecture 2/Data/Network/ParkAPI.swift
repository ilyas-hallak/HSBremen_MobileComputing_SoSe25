//
//  ParkAPI.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 28.04.25.
//


class ParkAPI {
    
    func fetchParks() -> [Park] {
        return [
            Park(name: "Yosemite Park"),
            Park(name: "Grand Canyon National Park"),
            Park(name: "Zion National Park"),
            Park(name: "Yellowstone National Park"),
            Park(name: "Rocky Mountain National Park"),            
        ]
    }
    
}
