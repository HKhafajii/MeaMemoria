//
//  APITestView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/1/24.
//

import SwiftUI

struct APITestView: View {
    
    @State var projects: [Project] = []
    
    var body: some View {
        VStack { // Use a VStack to wrap the content
            Text("Project List")
                .font(.largeTitle)
                .padding()
            
            if projects.isEmpty {
                Text("Give us a moment while we get what you need :)")
                    .font(.title3)
            } else {
                ScrollView {
                    VStack {
                        ForEach(projects) { project in
                            
                            Text(project.name)
                                .foregroundColor(.darkBrown)
                                .font(.title3)
                            
                            Text(project.comments)
                            
                            Text(project.status)
                                .padding(.bottom)
                            
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear(perform: {
            loadProject()
        })
    }
    
    
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

#Preview {
    APITestView()
}
