//
//  ShimmerView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 7/4/24.
//

import SwiftUI

final class ShimmerViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var projects: [Project] = []
    
    func loadProject() {
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
}

struct ShimmerView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ShimmerView()
}


//func loadProject() {
//    guard let url = URL(string: "http://127.0.0.1:8000/project/") else {
//        print("Api isn't working")
//        return
//    }
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//    request.addValue("application/json", forHTTPHeaderField: "Accept")
//    
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("API request error: \(error.localizedDescription)")
//            return
//        }
//        
//        guard let data = data else {
//            print("No data received")
//            return
//        }
// 
//        do {
//            let decodedProjects = try JSONDecoder().decode([Project].self, from: data)
//            DispatchQueue.main.async {
//                self.projects = decodedProjects
//            }
//        } catch let decodingError {
//            print("Decoding error: \(decodingError.localizedDescription)")
//        }
//        
//    }.resume()
//    
//}
