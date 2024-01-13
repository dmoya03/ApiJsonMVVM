//
//  Home.swift
//  JSON
//
//  Created by Daniel Moya on 8/1/24.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var login: PostViewModel
    @StateObject var json = Model1ViewModel()
    var body: some View {
        NavigationView{
            NavigationView{
                if json.dataModel.isEmpty {
                    ProgressView()
                } else {
                    List(json.dataModel, id: \.id){item in
                        VStack(alignment: .leading){
                            Text(item.name)
                            Text(item.address.geo.lat)
                        }
                    }.navigationTitle("JSON")
                        .navigationBarItems(
                            leading:
                                Button(action:{
                                    UserDefaults.standard.removeObject(forKey: "sesion")
                                    login.authenticated = 0
                                }){
                                    Text("Exit")
                                },
                            trailing:
                                NavigationLink(destination: Home2()){
                                    Text("Next")
                                }
                        )
                }
            }
                
        }
        
    }
}
