//
//  ContentView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 5/31/24.
//

import SwiftUI

struct MainScreen: View {
    let images: [String] = ["image1", "image2", "image3"]
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Image("BG")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Image("elephant")
                    .resizable()
                    .frame(maxWidth: 110, maxHeight: 150)
                    .offset(y: -320)
                
                VStack(spacing: 30) {
                    
                    Text("Mea Memoria")
                        .foregroundStyle(Color.customBrown)
                        .font(.fontMedium)
                        .padding(.top, 40)
                        .shadow(radius: 10, x: 0, y: 10)
                    
                    CarouselView()
                        .shadow(radius: 10, x: 0, y: 10)
                    
                    AlbumScrollView()
                    
                    NavigationLink {
                        
                        CreateView()
                            .navigationBarBackButtonHidden(true)
                        
                    } label: {
                        
                        VStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .tint(Color.customBrown)
                            
                            Text("Create Memoria")
                                .font(.fontSmall)
                                .foregroundStyle(Color.customBrown)
                        }
                        .shadow(radius: 10, x: 0, y: 10)
                        
                    } // end of navigation link
                    
                    .padding()
                    
                } // End of Vstack
                .padding()
                
            }
        }
    }
}

#Preview {
    MainScreen()
}


