//
//  PetsDataService.swift
//  Adopet
//
//  Created by Giovanna Moeller on 19/03/24.
//

import Foundation

enum NetworkingError: Error {
    case networkError(Error)
    case dataUnavailable
    case decodingError(Error)
    case urlUnavailable
}

class PetsDataService {
    func request(url: URL, completion: @escaping (Result<[Pet], NetworkingError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (responseData, _, error) in
            if let error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = responseData else {
                completion(.failure(.dataUnavailable))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([Pet].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}
