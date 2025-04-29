//
//  ParkRepository.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 28.04.25.
//

protocol ParkRepository {
    func fetchAllParks()
    func fetchAllParksHeavyLoad() async -> [Park]
    func getAllParks() -> [Park]
    func create(park: Park)
    func delete(park: Park)
}
