//
//  AccountModel.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 8/30/24.
//

import Foundation

struct Account: Codable, Hashable {
    var username: String
    var password: String
    var email: String
    var first_name: String
    var last_name: String
}
