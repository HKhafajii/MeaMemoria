//
//  NewAlbumView.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 8/15/24.
//

import SwiftUI

struct NewAlbumView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.5))
                .shadow(radius: 10, x: 0, y: 10)
                .background(.ultraThinMaterial)
                .frame(minWidth: 350, minHeight: 200)
            Image(systemName: "folder.badge.plus")
                .resizable()
                .frame(width: 60, height: 50)
                .foregroundStyle(.gray)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    NewAlbumView()
}
