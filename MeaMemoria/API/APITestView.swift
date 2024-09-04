//
//  APITestView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/1/24.
//

import SwiftUI

struct APITestView: View {
    
    
    @StateObject var manager = NetworkManager.shared
    
    var body: some View {
        VStack { // Use a VStack to wrap the content
            Text("Project List")
                .font(.largeTitle)
                .padding()
            
            if manager.projects.isEmpty {
                Text("Give us a moment while we get what you need :)")
                    .font(.title3)
            } else {
                ScrollView {
                    VStack {
                        ForEach(manager.projects) { project in
                            
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
            manager.request()
        })
    }
}

#Preview {
    APITestView()
}
