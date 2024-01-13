//
//  ContentView.swift
//  JSON
//
//  Created by Daniel Moya on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var login: PostViewModel
    
    var body: some View {
        Group {
            if login.authenticated == 0 {
                Login()
            } else if login.authenticated == 1 {
                Home()
            } else if login.authenticated == 2 {
                VStack{
                    Text("Incorrect username and/or password")
                    Button(action: {
                        login.authenticated = 0
                    }){
                       Text("Go back")
                    }
                }
            }
        }
    }
}

