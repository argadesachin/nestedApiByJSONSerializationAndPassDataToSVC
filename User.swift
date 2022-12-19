//
//  User.swift
//  JSONParsingTask1
//
//  Created by Mac on 19/11/22.
//

import Foundation

struct User{
    var page : Int
    var perPage : Int
    var total : Int
    var totalPages : Int
    var data : [[String:Any]]
    var support : [String:Any]
}

struct Data{
    var Id : Int
    var Email : String
    var firstName : String
    var lastName : String
    var image1 : String
}
