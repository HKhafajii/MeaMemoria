//
//  NetworkManager.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 9/3/24.
//

import Foundation

final class NetworkManager: ObservableObject {
    
    static let shared = NetworkManager()
    
    @Published var accountViewModel = AccountViewModel()
    
    @Published var projects: [Project] = []
    
    
    
    
    func request() {
        guard let url = URL(string: "http://127.0.0.1:8000/project/") else {
            print("Api isn't working")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("API request error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
     
            do {
                let decodedProjects = try JSONDecoder().decode([Project].self, from: data)
                DispatchQueue.main.async {
                    self.projects = decodedProjects
                }
            } catch let decodingError {
                print("Decoding error: \(decodingError.localizedDescription)")
            }
            
        }.resume()
        
    }
    
    func request(_ URL: String, completion: @escaping (Result<Void, Error>) -> Void) {
        
    }
    
    func postAccount() {
        
        guard let url = URL(string: "") else {
            print("Failed to create an account, check the api")
            return
        }
        
        var accountData = accountViewModel.account
        
    }
}
