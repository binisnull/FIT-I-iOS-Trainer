//
//  GetTrainerInfoModel.swift
//  FITI-Trainer-iOS
//
//  Created by 박윤빈 on 2023/01/30.
//

import Foundation

// MARK: - PolicyResponse
struct GetTrainerInfoResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: User
}

// MARK: - Result
struct User: Codable {
    let name, profile: String
    var background: String? = nil
    let levelName: String
    let school: String
    let grade: Double
    let cost: String
    var intro: String? = nil
    var service: String? = nil
    let reviewDto, imageList: [String]
    let matching_state: Bool
    var category : String? = nil
}

//MARK: - UserInfo Struct
struct UserInfo {
    var userName = ""
    var profile = ""
    var backGround = ""
    var imageList : [String] = []
    var email = ""
    var level = ""
    var cost = ""
    var location = ""
    var intro = ""
    var service = ""
    var school = ""
    var grade : Double = 0
    var matching_state = true
    var category = ""
}

