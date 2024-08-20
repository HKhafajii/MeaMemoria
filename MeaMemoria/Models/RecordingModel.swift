//
//  RecordingModel.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/25/24.
//

import Foundation

struct Recording: Hashable, Equatable {
    let fileURL: URL
    let createdAt: Date
    var isPlaying: Bool
}

