//
//  Contact.swift
//  Contacts
//
//  Created by Arshin Jain on 3/30/18.
//  Copyright © 2018 Arshin. All rights reserved.
//

import Foundation
import UIKit

struct Contact {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    let street: String
    let city: String
    let state: String
    let zip: String
    let image: UIImage?
    var favorite: Bool
}

extension Contact {
    
    struct Key {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let phone = "phoneNumber"
        static let email = "email"
        static let street = "streetAddress"
        static let city = "city"
        static let state = "state"
        static let zip = "zip"
        static let image = "avatarName"
    }
    
    
}

