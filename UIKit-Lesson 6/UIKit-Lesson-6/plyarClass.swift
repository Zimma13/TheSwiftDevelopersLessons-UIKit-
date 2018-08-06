//
//  plyarClass.swift
//  UIKit-Lesson-6
//
//  Created by Zimma on 06/08/2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import Foundation

class Plyar {
    
    var name: String { return UserDefaults.standard.string(forKey: "name") ?? "Еще не создан игрок" }
    var nik: String { return UserDefaults.standard.string(forKey: "nik") ?? "Еще не создан игрок" }
    var sex: String { return UserDefaults.standard.string(forKey: "sex") ?? "Еще не создан игрок" }
    
    var sexArray = ["Male", "Female", "I wasn't defined"]
    
    //save data
    func saveDataInUserDefault(name: String, nik: String, sexNum: Int) {
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(nik, forKey: "nik")
        UserDefaults.standard.set(sexArray[sexNum], forKey: "sex")
        UserDefaults.standard.synchronize()
    }
}
