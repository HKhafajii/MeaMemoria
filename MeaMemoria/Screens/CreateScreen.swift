//
//  CreateView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/25/24.
//

import SwiftUI

struct CreateView: View {
    @State var text = ""
    @ObservedObject var viewModel = ImageUtility()
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BG")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    
                VStack(spacing: 15) {
                    
                    HStack {
                        
                        NavigationLink {
                            
                            MainScreen()
                                .navigationBarBackButtonHidden(true)
                                .transition(.slide)
                            
                        } label: {
                            Image(systemName: "house")
                                .tint(Color.customBrown)
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .shadow(radius: 10, x: 0, y: 10)
                        }
                        
                        Spacer()
                       
                    }// end of Hstack
                    .padding()
                    
                    Text("What do you want to name your memory?")
                        .foregroundStyle(Color.customBrown)
                        .fontWeight(.bold)
                        .shadow(radius: 10, x: 0, y: 10)
                    
                    TextField("Enter a name...", text: $text)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                        .overlay(
                               RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.customBrown, lineWidth: 1)
                           )
                        .shadow(radius: 8, x: 0, y: 10)
                    Spacer()
                    
                    
                    
                    ImagePickerView()
                 
                    
                    Spacer()
                    //TODO: Fix the recording view and make the functionality work
                    RecordView()
                    
                    NavigationLink {
                        AlbumSelectionScreen()
                    } label: {
                        ZStack {
                            Image("buttonBG")
                                .shadow(radius: 10, x: 0, y: 10)
                            
                            Text("Never Forget This")
                                .foregroundStyle(Color.customWhite)
                                .fontWeight(.semibold)
                                .shadow(radius: 10, x: 0, y: 10)
                                .font(.title3)
                                .offset(y: -3)
                        }
                    }
                    .padding(.bottom)

                    
                    
                    
                } // End of vstack
                .padding()
            } // end of zstack
        }
    }
}

#Preview {
    CreateView()
}


