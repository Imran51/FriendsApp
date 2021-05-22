//
//  NetworkManager.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import Foundation

public class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchData<T: Codable>(for url: URL, completion: @escaping(Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data,_,error) in
            guard let data = data else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
            
        })
        
        task.resume()
    }
}
