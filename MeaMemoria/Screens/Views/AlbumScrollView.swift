//
//  AlbumScrollView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/25/24.
//

import SwiftUI

struct AlbumScrollView: View {
    let images: [String] = ["image1", "image2", "image3"]
    var body: some View {
        VStack {
            HStack {
                Text("Albums")
                    .font(.fontMedium)
                    .shadow(radius: 10, x: 0, y: 10)
                    .foregroundStyle(Color.customBrown)
                Spacer()
            } // End of Hstack
            
            Image("line")
                .offset(x: -5)
                .shadow(radius: 10, x: 0, y: 8)
            

            ScrollView(.horizontal){
                HStack(spacing: 30) {
                    ForEach(0..<images.count, id: \.self) { index in
                        
                        NavigationLink {
                            // TODO: Set up the albums to have their own pages
                            CarouselView()
                        } label: {
                            Image(images[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180,height: 180)
                                .cornerRadius(10)
                                .shadow(radius: 10, x: 0, y: 10)
                        }
                    }// end of foreach
                }// End of HStack
            } // end of ScrollView
        }
        
    }
}

#Preview {
    AlbumScrollView()
}
