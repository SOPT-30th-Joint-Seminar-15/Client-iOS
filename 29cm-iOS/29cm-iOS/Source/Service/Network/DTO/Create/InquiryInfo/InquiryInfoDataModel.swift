//
//  InquiryInfo.swift
//  29cm-iOS
//
//  Created by 김하늘 on 2022/06/03.
//

import Foundation

struct InquiryInfoResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [InquiryData]?
}

struct InquiryData: Codable {
    let id: String
    let userID: String
    let productName: String
    let orderDate: String
    let payMethod: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID = "userId"
        case productName, orderDate, payMethod
    }
}
