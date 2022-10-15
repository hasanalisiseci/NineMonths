//
//  NetworkManager.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://gist.githubusercontent.com/hasanalisiseci/783ff379a1ddf532bdc0d691fc0766aa/raw/5ccd135f606e8cf48cc486665a7588d4d4a02f97/isimler"

    static let babyImageURL = "https://images.unsplash.com/photo-1566004100631-35d015d6a491?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80"

    private init() {}

    func getNames(completed: @escaping (Result<[NameModel], ErrorTypes>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidUsername))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let _ = error {
                completed(.failure(.unableToComplete))
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let namesArray = try decoder.decode([NameModel].self, from: data)
                completed(.success(namesArray))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
}
