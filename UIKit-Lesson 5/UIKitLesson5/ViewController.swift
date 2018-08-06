//
//  ViewController.swift
//  UIKitLesson5
//
//  Created by Zimma on 30.04.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let picker = UIDatePicker()
    let lblOfDate = UILabel()
    let buttonAddDate = UIButton()
    let year = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = view.frame.size
        
        //picker
        picker.center = view.center
        picker.datePickerMode = .date
        
        //Label
        lblOfDate.frame = CGRect(x: Int(viewSize.width / 2 - 100), y: 130, width: 200, height: 100)
        lblOfDate.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        lblOfDate.text = "Выберите дату..."
        lblOfDate.textAlignment = .center
        lblOfDate.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //Button
        buttonAddDate.frame = CGRect(x: Int(viewSize.width / 2 - 150), y: Int(viewSize.height - 100), width: 300, height: 50)
        buttonAddDate.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        buttonAddDate.setTitle("Проверить", for: .normal)
        
        self.view.addSubview(picker)
        self.view.addSubview(lblOfDate)
        self.view.addSubview(buttonAddDate)
        
        picker.addTarget(self, action: #selector(dataPickerChenge(_:)), for: .valueChanged)
        buttonAddDate.addTarget(self, action: #selector(addDateOnLbl(_:)), for: .touchUpInside)
    }
    
    @objc func addDateOnLbl(_: UIButton) {
        let secondVC = SecondVC()
        if lblOfDate.text == "Выберите дату..." {
            let alert = UIAlertController(title: "eRRoR", message: "Вы не выбрали дату!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else {
            
        secondVC.dataFromFirstVC = lblOfDate.text!
        secondVC.year = year.string(from: picker.date)
        present(secondVC, animated: true, completion: nil)
            
        }
        
        
    }

    @objc func dataPickerChenge(_: UIDatePicker) {
        let formate = DateFormatter()
        formate.dateFormat = "dd-MM-yyyy"
        year.dateFormat = "yyyy"
        
        lblOfDate.text = formate.string(from: picker.date)
    }
}


