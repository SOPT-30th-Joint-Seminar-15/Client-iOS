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
        static let baseURL = "15.164.163.246:8000"
        
        // feature URL
        static let inquiryInfo = baseURL + "/user/:userId/inquiry"
        static let inquiryCreate = baseURL + "/inquiry/user"
        static let inquiryDelete = baseURL + "/inquiry/:inquiryId"
        static let purchaseInfo = baseURL + "/order/:orderNum"
    }
}
