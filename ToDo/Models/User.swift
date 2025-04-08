//
//  User.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import Foundation


struct User: Codable {
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
