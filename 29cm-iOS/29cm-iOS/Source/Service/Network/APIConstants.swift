//
//  APIConstants.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/30.
//

import Foundation

extension Const {
    struct APIConstants {
        // base URI
        static let baseURL = "http://15.164.163.246:8000"
        
        // feature URL
        static let inquiryCreate = baseURL + "/inquiry/user"
        static var userId = String()
        static var inquiryRead : String{
            return baseURL+"/user/\(userId)/inquiry"
        }
        static let purchaseInfo = baseURL + "/order/"
    }
}
