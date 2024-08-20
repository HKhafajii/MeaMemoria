////
//  CarouselView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/17/24.
//

import SwiftUI

    struct CarouselView: View {
        @State private var index = 0
        let images: [String] = ["image1", "image2", "image3"]
        let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

        var body: some View {
            VStack{
                TabView(selection: $index) {
                    ForEach((0..<images.count), id: \.self) { image in
                        Image(images[image])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350,height: 280)
                            .cornerRadius(10)
                            .clipped()
                            .tag(image)
                            .overlay(
                                   RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.customBrown, lineWidth: 0.7)
                               )
                            .padding()
                            
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
            .frame(height: 300)
            .onReceive(timer) { _ in
                withAnimation {
                    index = (index + 1) % images.count
                }
            }
        }
    }

#Preview {
    CarouselView()
}
