//
//  ChangeCategoryModel.swift
//  FITI-Trainer-iOS
//
//  Created by 박윤빈 on 2023/02/01.
//

import Foundation

struct ChangeCategoryResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message, result: String
}
