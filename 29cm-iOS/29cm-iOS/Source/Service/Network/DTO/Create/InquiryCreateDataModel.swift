//
//  InquiryCreateDataModel.swift
//  29cm-iOS
//
//  Created by 정은희 on 2022/05/30.
//

import Foundation

// 예시용 파일 (확인 후 주석 삭제 예정 ...)

struct InquiryCreateResponse: Codable {
    let status: Int
    let success: Bool?
    let message: String
    let data: InquiryCreateData?
}

struct InquiryCreateData: Codable {
    let id: String
    
    // 실제 사용할 것과 같은 이름으로 맞춰주는 부분입니다
    enum CodingKeys: String, CodingKey {
        case id = "_id"
    }
    
    // 서버로부터 넘어올 데이터 내에 key-value가 없는 상황을 대비해 미리 초기화 해뒀습니다
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? values.decode(String.self, forKey: .id)) ?? ""
    }
}
