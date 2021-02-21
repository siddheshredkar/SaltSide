//
//  SSErrors.swift
//  saltside
//
//  Created by Siddhesh Redkar on 21/02/21.
//  Copyright © 2021 Siddhesh Redkar. All rights reserved.
//

import Foundation

// conforms to the Error protoype
enum SSErrors: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from server. Please try again."
    case invalidData        = "The data recieved from the server was invalid. Please try again"
    case unableToFavorite   = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "You've already favorited this user."
    case decodingError = "decodingError"
    
    case invalidUrl = "url Incorrct"
}
