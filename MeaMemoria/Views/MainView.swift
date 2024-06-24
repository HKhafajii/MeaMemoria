//
//  ContentView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 5/31/24.
//

import SwiftUI

struct MainView: View {
    let images: [String] = ["image1", "image2", "image3"]
    var body: some View {
        ZStack {
            
            Image("BG")
                .resizable()
                .scaledToFill()
                .offset(y: -15)
            
            Image("elephant")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 150)
                .offset(y: -320)
            
                
            VStack(spacing: 30) {
                
                Text("Mea Memoria")
                    .foregroundStyle(Color.customBrown)
                    .fontWeight(.bold)
                    .font(.fontMedium)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    
                    .shadow(radius: 10, x: 0, y: 10)
                
                CarouselView()
                    .shadow(radius: 10, x: 0, y: 10)
                
                
                
                
                
                VStack {
                    HStack {
                        Text("Albums")
                            .font(.fontMedium)
                            .shadow(radius: 10, x: 0, y: 10)
                            .foregroundStyle(Color.customBrown)
                        Spacer()
                    } // End of Hstack
                    
                    Divider()
                     
                    
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 30) {
                            ForEach(0..<images.count, id: \.self) { index in
                                
                                Image(images[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 180,height: 180)
                                    .cornerRadius(10)
                                    .shadow(radius: 10, x: 0, y: 10)
                            }// end of foreach
                        }// End of HStack
                    } // end of ScrollView
                }
                
                
                
              
                
                Spacer()
                Button(action: {
                    
                    // Add create function here
                    
                }, label: {
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

                    
                })
                .padding(.bottom)
            } // End of Vstack
            .padding()
        }
    }
}

#Preview {
    MainView()
}

extension Font {
   static var fontLarge: Font {
        return (Font.custom("Mangabey", size: 48))
    }
    static var fontMedium: Font {
         return (Font.custom("Mangabey", size: 36))
     }
    static var fontSmall: Font {
         return (Font.custom("Mangabey", size: 24))
     }
}

extension Color {
    static var customBrown: Color {
        return Color("darkBrown")
    }
}
