//
//  Book.swift
//  My Little Library
//
//  Created by Imandi on 4/23/25.
//

import Foundation
struct Book : Codable{
    var title: String
    var author: String
    var category: String  // "Read", "Reading", or "Want to Read"
}
