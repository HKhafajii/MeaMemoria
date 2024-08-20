//
//  AlbumSelectionScreen.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/26/24.
//

import SwiftUI

struct AlbumSelectionScreen: View {
    var albums: [String] = ["image1", "image2", "image3"]
    var body: some View {
        
        NavigationStack {
            
            ZStack {

                Image("BG")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack(spacing: 50) {
                        
                        Text("Choose a home for your memory...")
                            .foregroundStyle(Color.customBrown)
                            .fontWeight(.bold)
                            .shadow(radius: 10, x: 0, y: 10)
                            .padding(.top, 25)
                        
                        ZStack {
                            NavigationLink(destination: MainScreen()) {
                                NewAlbumView()
                            }
                        }
                        
                        ForEach(0..<albums.count, id: \.self) { album in
                            NavigationLink {
                                // TODO: Set up the albums to have their own pages
                                MainScreen()
                            } label: {
                                Image(albums[album])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxHeight: 200)
                                    .cornerRadius(10)
                                    .shadow(radius: 10, x: 0, y: 10)
                            }
                        }
                        
                        
                        Spacer()
                        
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    AlbumSelectionScreen()
}
