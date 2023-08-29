//
//  DataListViewModel.swift
//  MokeyDataList
//
//  Created by catalina lozano on 29/08/23.
//

import Foundation

class DataListViewModel: ObservableObject {
    
    struct Respuesta: Codable {
        var message: String
        var userID: Int
        var name, email: String
        var mobile: Int
        var profileDetails: ProfileDetail
        var dataList: [DataDetail]
    }
    struct DataDetail: Codable {
        var id: Int
        var value: String
    }
    
    struct ProfileDetail: Codable {
        let isProfileComplete: Bool
        let rating: Double
    }
    
    @Published var urlString = "https://run.mocky.io/v3/4068b90d-9dd9-48ae-8085-8729589e3fc7"
    @Published var msg = ""
    @Published var dataDetailArray: [DataDetail] = []
    @Published var profile = ProfileDetail.self
    
    func getData() async {
        print("We are accessing to url: \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("error: could not create a url from \(urlString)")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let returned = try? JSONDecoder().decode(Respuesta.self, from: data) else {
                print("Json error: could not decode return json data")
                return
            }
            print("Json returned! message: \(returned.message) ")
            self.msg = returned.message
            self.dataDetailArray = returned.dataList
            
        } catch {
            print("error: could not user url at \(urlString) to get data response")
        }
    }

    
}
