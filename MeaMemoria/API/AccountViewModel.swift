//
//  AccountViewModel.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 8/30/24.
//

import Foundation

class AccountService {
    
}

class AccountViewModel: ObservableObject {
    
    @Published var account: Account
    let guestAccount = Account(username: "Guest", password: "guest123", email: "guest@guesting.com", first_name: "Guest", last_name: "Guest")
    
    // Constructor
    init(account: Account) {
        self.account = account
    }
    
    // Free init for guests
    init() {
        self.account = guestAccount
    }
    
    
}
