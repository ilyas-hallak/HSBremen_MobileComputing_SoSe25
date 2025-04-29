//
//  UseCaseFactory.swift
//  SoSe25
//
//  Created by Ilyas Hallak on 28.04.25.
//


class UseCaseFactory {
    
    class func fetchParksUseCase() -> FetchParskUseCase {
        return FetchParskUseCase(repository: CoreDataParkRepository())
    }
    
    class func createParksUseCase() -> CreateParkUseCase {
        return CreateParkUseCase(repository: CoreDataParkRepository())
    }
    
    class func getParksCountUseCase() -> GetParksCountUseCase {
        return GetParksCountUseCase(repository: CoreDataParkRepository())
    }
    
    class func fetchAllParksHeavyLoad() -> FetchParksHeavyLoadkUseCase {
        return FetchParksHeavyLoadkUseCase(repository: CoreDataParkRepository())
    }
}
