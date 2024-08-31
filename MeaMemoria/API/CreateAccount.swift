//
//  CreateAccount.swift
//  MeaMemoria
//
//  Created by Hassan Alkhafaji on 8/30/24.
//

import SwiftUI

struct CreateAccount: View {
    @StateObject var account: AccountViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                BackGround()
                VStack {
                    
                    VStack(spacing: 20) {
                        Text("Create an account")
                            .foregroundStyle(.offWhite)
                            .font(.title)
                            .shadow(radius: 10, x: 0, y: 10)
                        
                        TextField("First name...", text: $account.account.first_name)
                            .foregroundStyle(.darkBrown)
                            .padding(.leading, 1)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                        
                        TextField("Last name...", text: $account.account.last_name)
                            .foregroundStyle(.darkBrown)
                            .padding(.leading, 1)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                        
                        TextField("Email address...", text: $account.account.email)
                            .foregroundStyle(.darkBrown)
                            .padding(.leading, 1)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                        
                        TextField("Username...", text: $account.account.username)
                            .foregroundStyle(.darkBrown)
                            .padding(.leading, 1)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                        
                        SecureField("Password...", text: $account.account.password)
                            .foregroundStyle(.darkBrown)
                            .padding(.leading, 1)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                    }// end of create stack
                    .padding()
                    .padding(.bottom)
                    .background(RoundedRectangle(cornerRadius: 8).fill(.darkBrown))
                    .shadow(radius: 10, x: 0, y: 10)
                    .padding()
                    
                    NavigationLink {
                        APITestView()
                    } label: {
                        ZStack {
                            Image("buttonBG")
                                .shadow(radius: 10, x: 0, y: 10)
                            
                            Text("Get Started!")
                                .foregroundStyle(Color.customWhite)
                                .fontWeight(.semibold)
                                .shadow(radius: 10, x: 0, y: 10)
                                .font(.title3)
                                .offset(y: -3)
                        }
                    }// end of navigation link
                    
                    NavigationLink {
                        MainScreen()
                    } label: {
                        Text("Already have an account?")
                    }
                    
                    
                    
                    
                    .padding()
                }
                
                
            }
        }
    }
}

#Preview {
    CreateAccount(account: AccountViewModel.init())
}


struct BackGround: View {
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Image("elephant")
                .resizable()
                .frame(maxWidth: 110, maxHeight: 150)
                .offset(y: -320)
                .shadow(radius: 10, x: 0, y: 10)
        }
    }
}
