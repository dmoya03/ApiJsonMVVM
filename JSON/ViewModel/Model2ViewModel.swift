//
//  Model2ViewModel.swift
//  JSON
//
//  Created by Daniel Moya on 12/1/24.
//

import Foundation

class Model2ViewModel: ObservableObject {
    
    @Published var dataModel = Model2(data: [])
    
    init() {
       fetch()
    }
    
    func fetch(){
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return }
        
        URLSession.shared.dataTask(with: url){data,_,_ in
            guard let data = data else { return }
            
            do{
                let json = try JSONDecoder().decode(Model2.self, from: data)
                DispatchQueue.main.async {
                    self.dataModel = json
                }
            }catch let error as NSError{
                print("Json error", error.localizedDescription)
            }
        }.resume()
    }
}
