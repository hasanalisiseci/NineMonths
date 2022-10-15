//
//  ErrorTypes.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Foundation

enum ErrorTypes: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection!"
    case invalidResponse = "Invalid response from the server. Please try again!"
    case invalidData = "The data received from the server was invalid. Please try again!"
}
