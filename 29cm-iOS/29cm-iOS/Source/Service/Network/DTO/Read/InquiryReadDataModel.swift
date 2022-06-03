//
//  Temp.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/30.
//

import Foundation

struct InquiryReadResponse: Codable {
    let status: Int
    let success: Bool?
    let message: String
    let data: [InquiryReadData]?
}

struct InquiryReadData: Codable {
    let inquiryId: String
    let inquiryCategory: String
    let question: String
    let createdAt: String
    let answer: String
    let isAnswered: Bool
    
    enum CodingKeys: String, CodingKey {
        case inquiryId, inquiryCategory, question, createdAt,answer,isAnswered
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        inquiryId = (try? values.decode(String.self, forKey: .inquiryId)) ?? ""
        inquiryCategory = (try? values.decode(String.self, forKey: .inquiryCategory)) ?? ""
        question = (try? values.decode(String.self, forKey: .question)) ?? ""
        createdAt = (try? values.decode(String.self, forKey: .createdAt)) ?? ""
        answer = (try? values.decode(String.self, forKey: .answer)) ?? ""
        isAnswered = (try? values.decode(Bool.self, forKey: .isAnswered)) ?? false
    }
}

//{
//    "status": 200,
//    "success": true,
//    "message": "유저 문의 조회",
//    "data": [
//        {
//            "inquiryId": "628f2a4174995ed500bc18e9",
//            "inquiryCategory": "배송문의",
//            "question": "제곧내",
//            "createdAt": "2022-05-26",
//            "answer": "",
//            "isAnswered": false
//        },
//        {
//            "inquiryId": "628f2a4174995ed500bc18e9",
//                        "inquiryCategory": "웅앵문의",
//            "question": "히히 다른아이디",
//            "createdAt": "2022-05-27",
//            "answer": "",
//            "isAnswered": false
//        },
//        {
//            "inquiryId": "628f2a4174995ed500bc18e9",
//                        "inquiryCategory": "기타문의",
//            "question": "니다",
//            "createdAt": "2022-05-27",
//            "answer": "",
//            "isAnswered": false
//        }
//    ]
//}
