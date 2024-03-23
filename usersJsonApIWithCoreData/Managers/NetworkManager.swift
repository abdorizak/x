//
// NetworkManager.swift
// usersJsonApIWithCoreData
//
// Created by Abdirizak Hassan on 3/23/24. 💻
// Copyright © 2024 Abdirizak Hassan DR X. All Rights Reserved.
//
// GitHub: https://github.com/abdorizak
// Website: https://abdorizak.dev


import Foundation

enum UsersError: String, Error {
    
    case invalidInsertion = "Failed to Insert"
    case invalidData = "Invalid Data"
    case invalidURL = "Bad URL"
    case invalidResponse = "InvalidResponse"
    case somethingWrong = "Something Wen happen!"
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let apiURL = "https://jsonplaceholder.typicode.com/users"
    private init() {}
    
//    func getUsers() async throws -> [Users] {
//        guard let enpoi
//    }
    
    func getUsers(completed: @escaping(Result<[Users], UsersError>) -> Void) {
        let enpoint = URL(string: apiURL)
        guard let endpoint = enpoint else {
            completed(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: endpoint) { data, response, error in
            if let _ = error {
                completed(.failure(.somethingWrong))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decorder = JSONDecoder()
                let users = try decorder.decode([Users].self, from: data)
                completed(.success(users))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }.resume()
    }
}
