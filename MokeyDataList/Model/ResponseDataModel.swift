//
//  ResponseDataModel.swift
//  MokeyDataList
//
//  Created by catalina lozano on 29/08/23.
//

import Foundation
    
    struct ResponseData: Decodable {
        let message: String
        let userID: Int
        let name, email: String
        let mobile: Int
        let profileDetails: ProfileDetails
      //  let dataList: [DataList]
    }

    struct DataList: Decodable {
        let id: Int
        let value: String
    }

    struct ProfileDetails: Decodable {
        let isProfileComplete: Bool
        let rating: Double

    }

