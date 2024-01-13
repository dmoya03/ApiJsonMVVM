//
//  Home2.swift
//  JSON
//
//  Created by Daniel Moya on 12/1/24.
//

import SwiftUI

struct Home2: View {
    
    @StateObject var json2 = Model2ViewModel()
    
    var body: some View {
        if json2.dataModel.data.isEmpty {
            ProgressView()
        } else {
            List(json2.dataModel.data, id: \.id){ item in
                NavigationLink(destination: DetailView(id: item.id)){
                    HStack{
                        Image(systemName: "person.fill")
                            .data(url: URL(string: item.avatar)!)
                            .frame(width: 80, height: 80)
                            .clipped()
                            .clipShape(Circle())
                        VStack(alignment: .leading){
                            Text(item.first_name).font(.title)
                            Text(item.email).font(.subheadline)
                        }
                    }.navigationBarTitle("JSON WITH IMG")
                }
                
            }
        }
    }
}

extension Image {
    
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self.resizable()
    }
}
