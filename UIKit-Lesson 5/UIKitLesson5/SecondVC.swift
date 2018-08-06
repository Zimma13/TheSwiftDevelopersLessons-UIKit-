//
//  SecondVC.swift
//  UIKitLesson5
//
//  Created by Zimma on 30.04.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var lbl = UILabel()
    var lblWhateTheYear = UILabel()
    let buttonToEnd = UIButton()
    var dataFromFirstVC = "Пусто"
    var year = "123"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = view.frame.size
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //Date Label
        lbl.frame = CGRect(x: Int(viewSize.width / 2 - 150), y: 200, width: 300, height: 50)
        lbl.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        lbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.textAlignment = .center
        lbl.text = dataFromFirstVC
        
        // Whate the year label
        lblWhateTheYear.frame = CGRect(x: 0, y: 0, width: 350, height: 50)
        lblWhateTheYear.center = view.center
        lblWhateTheYear.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        lblWhateTheYear.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lblWhateTheYear.textAlignment = .center
        lblWhateTheYear.text = Int(year)! % 4 == 0 ? "Этот год високосный!" : "Этот год Не Високосный"
        
        //Button to dissmis
        buttonToEnd.frame = CGRect(x: Int(viewSize.width / 2 - 150), y: Int(viewSize.height - 100), width: 300, height: 50)
        buttonToEnd.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        buttonToEnd.setTitle("Вернуться", for: .normal)
        
        view.addSubview(lbl)
        view.addSubview(lblWhateTheYear)
        view.addSubview(buttonToEnd)
        
        buttonToEnd.addTarget(self, action: #selector(exitViewButton(_:)), for: .touchUpInside)
        
    }
    
    @objc func exitViewButton(_: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
