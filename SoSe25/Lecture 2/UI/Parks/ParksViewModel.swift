//
//  ParksViewModel.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 28.04.25.
//

import Observation
import CoreData

@Observable
class ParksViewModel {
    
    // MARK: UseCases
    
    private let fetchParksUseCase: FetchParskUseCase
    private let createParkUseCase: CreateParkUseCase
    private let getParksCountUseCase: GetParksCountUseCase
    private let fetchParksHeavyLoadkUseCase: FetchParksHeavyLoadkUseCase
    
    var title: String { "Parks (\(getParksCount()))" }
    
    init() {
        // dependency injection possible here
        self.fetchParksUseCase = UseCaseFactory.fetchParksUseCase()
        self.createParkUseCase = UseCaseFactory.createParksUseCase()
        self.getParksCountUseCase = UseCaseFactory.getParksCountUseCase()
        self.fetchParksHeavyLoadkUseCase = UseCaseFactory.fetchAllParksHeavyLoad()
    }
    
    func fetchParks() {
        fetchParksUseCase.fetchParks()
    }

    func fetchParksHeavyLoading() async -> [Park] {
        return await fetchParksHeavyLoadkUseCase.fetchAllParksHeavyLoad()
    }
    
    func createPark(name: String) {
        createParkUseCase.execute(Park(name: name))
    }
    
    private func getParksCount() -> Int {
        getParksCountUseCase.getParksCount()
    }
}
