//
// UsersModel.swift
// usersJsonApIWithCoreData
//
// Created by Abdirizak Hassan on 3/23/24. 💻
// Copyright © 2024 Abdirizak Hassan DR X. All Rights Reserved.
//
// GitHub: https://github.com/abdorizak
// Website: https://abdorizak.dev


import Foundation

struct Users: Codable {
    let name: String
    let email: String
    let address: UsersAddress
}

struct UsersAddress: Codable {
    var street: String
}


//
func x<T>(_ a1: T, a2:T) {
    return
}
