//
//  Movie.swift
//  Multithreading
//
//  Created by erumaru on 2/29/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import Foundation

class Movie: Codable {
    var id: String
    var employee_name: String
    var employee_salary: String
    var employee_age: String
    var profile_image: String
    
   
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case employee_name = "employee_name"
        case employee_salary = "employee_salary"
        case employee_age = "employee_age"
        case profile_image = "profile_image"
        
    }
}
