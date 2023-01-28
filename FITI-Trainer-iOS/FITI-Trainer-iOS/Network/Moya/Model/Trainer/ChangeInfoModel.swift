//
//  ChangeInfoModel.swift
//  FITI-Trainer-iOS
//
//  Created by 박윤빈 on 2023/01/28.
//

import Foundation

struct ChangeInfoResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message, result: String
}
