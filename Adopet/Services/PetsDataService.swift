//
//  PetsDataService.swift
//  Adopet
//
//  Created by Giovanna Moeller on 19/03/24.
//

import Foundation

class PetsDataService {
    
    private var networkingService: NetworkingProtocol = URLSessionNetworking()
    
    func fetchPets(completion: @escaping (Result<[Pet], NetworkingError>) -> Void) {
        guard let url = URL(string: "https://my-json-server.typicode.com/giovannamoeller/pets-api/pets") else { return }
        networkingService.request(url, completion: completion)
    }
}
