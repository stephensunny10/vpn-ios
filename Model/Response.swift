//
//  Response.swift
//  comera
//
//  Created by Mac on 27/03/24.
//

import Foundation
struct UserResponse: Codable {
    let success: Bool
    let message: String
    let data: UserData
}

struct UserData: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let profile: String
    let email: String
    let password: String
    let role: String
    let status: String
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case id, firstName = "first_name", lastName = "last_name", profile, email, password, role, status, accessToken = "access_token"
    }
}


