//
//  JSONApp.swift
//  JSON
//
//  Created by Daniel Moya on 4/1/24.
//

import SwiftUI

@main
struct JSONApp: App {
    var body: some Scene {
        let login = PostViewModel()
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}
