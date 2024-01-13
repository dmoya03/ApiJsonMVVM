//
//  Login.swift
//  JSON
//
//  Created by Daniel Moya on 8/1/24.
//

import SwiftUI

struct Login: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var login: PostViewModel
    
    var body: some View {
        ZStack{
            Color.blue.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Email").foregroundColor(.white).foregroundStyle(.white).bold()
                TextField("Email", text: $email)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                Text("Password").foregroundColor(.white).foregroundStyle(.white).bold()
                SecureField("Password", text: $password)
                    .background(Color.white)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    login.login(email: email, password: password)
                }){
                    Text("Login").foregroundColor(.white).foregroundStyle(.white).bold()
                }
                
            }.padding()
        }
    }
}
