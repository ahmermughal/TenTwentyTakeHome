//
//  NetworkError.swift
//  TentwentyTakeHome
//
//  Created by Ahmer Mughal on 6/12/22.
//

import Foundation

enum NetworkError : String, Error{
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please Try Again."
    case invalidData = "The data received from the server was invalid. Please Try Again."
    
}
