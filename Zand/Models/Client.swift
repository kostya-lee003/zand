//
//  Client.swift
//  Zand
//
//  Created by Kostya Lee on 13/03/22.
//

import Foundation
import UIKit

// Пока что недоработанная модель клиента
class Client {
    private var name: String
    private var id: UUID
    private var email: String
    private var profileImage: UIImage
    private var password: String
    private var savedPosts: [Post]
//    private var subscribes: [Master]
    
    public init() {
        name = ""
        id = UUID()
        email = ""
        profileImage = UIImage.actions
        password = ""
        savedPosts = [Post(), Post()]
    }
    
    func sendData() -> Int {
        rate
    }
}

private extension Client {
    var rate: Int {
        0
    }
    
    var total_bookings: Int {
        0
    }
    
    var total_bookings_canceled: Int {
        0
    }
}
