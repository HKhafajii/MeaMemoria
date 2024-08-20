//
//  MemoryModel.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 7/2/24.
//

import Foundation
import SwiftUI

struct MemoryModel: Identifiable {
    var id: UUID
    var image: Image?
    var voiceRecording: URL?
}

extension MemoryModel: Equatable {
    static func == (lhs: MemoryModel, rhs: MemoryModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
