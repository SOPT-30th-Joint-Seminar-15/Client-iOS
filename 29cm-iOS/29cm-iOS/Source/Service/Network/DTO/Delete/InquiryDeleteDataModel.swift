//
//  InquiryDeleteDataModel.swift
//  29cm-iOS
//
//  Created by 김지민 on 2022/06/03.
//

import Foundation

struct InquiryDeleteResponse: Codable {
    let status: Int
    let success: Bool?
    let message: String
}

