//
//  PostViewModel.swift
//  JSON
//
//  Created by Daniel Moya on 4/1/24.
//

import Foundation

class PostViewModel: ObservableObject {
    
    @Published var authenticated = 0
    
    init() {
        if let sesion = UserDefaults.standard.object(forKey: "sesion") as? Int {
           authenticated = sesion
        } else {
           authenticated = 0
        }
    }
    
    func login(email: String, password: String){
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        let params = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: params)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){data, response, error in
            if let response = response{
                print(response)
            }
            guard let data = data else { return }
            do{
                let allData = try JSONDecoder().decode(PostModel.self, from: data)
                if !allData.token.isEmpty{
                    DispatchQueue.main.async {
                        self.authenticated = 1
                        UserDefaults.standard.setValue(1, forKey: "sesion")
                    }
                }
            } catch let error as NSError {
                print("Post error", error.localizedDescription)
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }
            
        }.resume()
    }
    
    
    
}
