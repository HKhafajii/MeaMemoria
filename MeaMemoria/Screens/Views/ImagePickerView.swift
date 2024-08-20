//
//  ImagePickerView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/26/24.
//

import SwiftUI
import PhotosUI

struct ImagePickerView: View {
    @ObservedObject var viewModel = ImageUtility()
    @State var data: Data? = nil
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Pick a memory, any memory...")
                .foregroundStyle(Color.customBrown)
                .fontWeight(.bold)
                .shadow(radius: 10, x: 0, y: 10)
            
            if let image = data, let uiImage = UIImage(data: image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 10, x: 0, y: 10)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                
                PhotosPicker(
                    selection: $viewModel.imageSelection
                    
                    , matching: .images
                ) {
                    Image(systemName: "photo")
                        .font(.system(size: 36))
                        .foregroundStyle(Color.customBrown)
                        .shadow(radius: 10, x: 0, y: 10)
                        .onChange(of: viewModel.imageSelection) { _, newValue in
                            guard let item = newValue else {return}
                            item.loadTransferable(type: Data.self) { result in
                                switch result {
                                case .success(let data):
                                    if let data = data {
                                        self.data = data
                                        let uuid = UUID().uuidString
                                        let fileName = self.getDocumentsDirectory().appendingPathComponent("\(uuid).png")
                                        try? data.write(to: fileName)
                                    } else {
                                        print("Data is nill")
                                    }
                                case .failure(let failure):
                                    print("Didn't work \(failure.localizedDescription)")
                                }
                            }
                        }
                }
            }
        }
    }
    func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
}

#Preview {
    ImagePickerView()
}
