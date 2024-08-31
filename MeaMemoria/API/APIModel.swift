//
//  APIModel.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 6/1/24.
//

import Foundation


struct Project: Codable, Hashable, Identifiable {
    let id = UUID()
    let name: String
    let comments: String
    let status: String
}

