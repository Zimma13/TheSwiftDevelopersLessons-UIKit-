//
//  ClienClass.swift
//  UIKitLesson5-1
//
//  Created by Zimma on 02.05.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import Foundation
import UIKit

class Human {
    var firstName = ""
    var secondName = ""
    var cardNum = 0
    var email = ""
    

}

class Client: Human {
    let whois = "Клиент"
    let bgColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    let secondBgColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    
    var password = ""
    
}

class Programmist: Human {
    let whois = "Программист"
    let bgColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    let secondBgColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    let techArray = ["iOS", "android", "web"]
    
    var language = ""
    var exp = 0

}



