//
//  ListaVM.swift
//  MokeyDataList
//
//  Created by catalina lozano on 29/08/23.
//

import Foundation

class ListaVM: ObservableObject{
    @Published var respData = ResponseData.self
    @Published var msgs = ""
    
    init(){
           getPosts()
       }
    
    func getPosts(){
        guard let url = URL(string: "https://run.mocky.io/v3/4068b90d-9dd9-48ae-8085-8729589e3fc7") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data.")
                return
            }
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Invalid response.")
                return
            }
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status code should be 2xx, but is \(response.statusCode)")
                return
            }
            print("Successfully download data!")
            print(data)
            
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            
            guard let newPost = try? JSONDecoder().decode(ResponseData.self, from: data) else {return}
            DispatchQueue.main.async { [weak self] in
                self?.respData.init(message: newPost.message, userID: newPost.userID, name: newPost.name, email: newPost.email, mobile: newPost.mobile, profileDetails: newPost.profileDetails)
            }
            
            self.msgs = newPost.message
            print(newPost)
           
        }.resume()
    }
    
}
