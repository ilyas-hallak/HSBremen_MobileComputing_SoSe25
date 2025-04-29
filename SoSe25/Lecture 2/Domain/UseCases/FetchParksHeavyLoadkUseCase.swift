//
//  FetchParsHeavyLoadkUseCase.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 29.04.25.
//


class FetchParksHeavyLoadkUseCase {
    
    var repository: ParkRepository
    
    init(repository: ParkRepository) {
        self.repository = repository
    }
    
    func fetchAllParksHeavyLoad() async -> [Park] {
        return await repository.fetchAllParksHeavyLoad()
    }
}
