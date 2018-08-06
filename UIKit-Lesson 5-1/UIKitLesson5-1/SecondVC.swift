//
//  SecondVC.swift
//  UIKitLesson5-1
//
//  Created by Zimma on 01.05.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class SecondVC: UIViewController, UITextFieldDelegate {
    
    var whois = ""
    lazy var person = Client()
    lazy var proger = Programmist()
    
    let lblHeader = UILabel()
    let saveButton = UIButton()
    let techPicker = UIPickerView()
    
    var firstName = UITextField()
    var secondName = UITextField()
    var cardNum = UITextField()
    var email = UITextField()
    
    lazy var password = UITextField()
    lazy var tech = UITextField()
    lazy var lang = UITextField()
    lazy var exp = UITextField()
    
    lazy var languageOfProg = UITextField()
    lazy var experience = UITextField()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let viewSize = view.frame.size
        
        
        techPicker.dataSource = self
        techPicker.delegate = self
        
        //header
        lblHeader.frame = CGRect(x: 0, y: 0, width: Int(viewSize.width), height: 60)
        lblHeader.text = whois
        lblHeader.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lblHeader.textAlignment = .center
        
        //TextFields
        addTextFieldView(name: firstName, yPos: 100, placeHolder: "Введите Имя...")
        addTextFieldView(name: secondName, yPos: Int(firstName.frame.size.height) + 110, placeHolder: "Введите Фамилию...")
        addTextFieldView(name: email, yPos: Int(secondName.frame.size.height) + 150, placeHolder: "Введите email...")
        addTextFieldView(name: cardNum, yPos: Int(email.frame.size.height) + 190, placeHolder: "Введите № карты...")
        
        //Настройки TextField'ов
        cardNum.keyboardType = .numberPad
        cardNum.delegate = self
        
        //Save Button
        saveButton.frame = CGRect(x: Int(viewSize.width) / 2 - 150, y: Int(viewSize.height) - 100, width: 300, height: 50)
        saveButton.setTitle("Сохранить", for: .normal)
        
        //Дополнения в зависимости от выбранной категории
        clientAdd(whois: whois)
        
        view.addSubview(lblHeader)
        view.addSubview(saveButton)
        
        saveButton.addTarget(self, action: #selector(saveButtonClick(_: )), for: .touchUpInside)
    }
    
    @objc func saveButtonClick(_: UIButton) {
        
        switch whois {
        case "Программист":
            if firstName.text != "" && secondName.text != "" && email.text != "" && cardNum.text != "" && lang.text != "" && exp.text != "" {
                proger.firstName = firstName.text!
                proger.secondName = secondName.text!
                proger.email = email.text!
                proger.cardNum = Int(cardNum.text!)!
                proger.language = lang.text!
                proger.exp = Int(exp.text!)!
                
                alertMsg(title: "Все хорошо!", msg: "Вы сохранили свои данные как \(whois)", end: true)
                
            } else {
                alertMsg(title: "Ошибка", msg: "Не все поля заполнены", end: false)
            }
            
        case "Клиент":
            if firstName.text != "" && secondName.text != "" && email.text != "" && cardNum.text != "" && password.text != "" {
                person.firstName = firstName.text!
                person.secondName = secondName.text!
                person.email = email.text!
                person.cardNum = Int(cardNum.text!)!
                person.password = password.text!
                
                alertMsg(title: "Все хорошо!", msg: "Вы сохранили свои данные как \(whois)", end: true)
            } else {
                alertMsg(title: "Ошибка", msg: "Не все поля заполнены", end: false)
            }
            
        default:
            break
        }
        

    }
    
    func addTextFieldView(name: UITextField, yPos: Int, placeHolder: String){
        
        name.frame = CGRect(x: 10, y: yPos, width: Int(view.frame.size.width) - 20, height: 30)
        name.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        name.placeholder = placeHolder
        
        view.addSubview(name)
    }
    
    func clientAdd(whois: String) {
        
        switch whois {
        case "Программист":
            let person = Programmist()
            view.backgroundColor = person.bgColor
            lblHeader.backgroundColor = person.secondBgColor
            saveButton.backgroundColor = person.secondBgColor
            
            addTextFieldView(name: tech, yPos: Int(cardNum.frame.size.height) + 230, placeHolder: "Выберите технологию...")
            addTextFieldView(name: lang, yPos: Int(tech.frame.size.height) + 270, placeHolder: "Введите язык...")
            addTextFieldView(name: exp, yPos: Int(lang.frame.size.height) + 310, placeHolder: "Введите опыт в годах...")
            
            tech.inputView = techPicker
            
            exp.keyboardType = .numberPad
            
        case "Клиент":
            let person = Client()
            view.backgroundColor = person.bgColor
            lblHeader.backgroundColor = person.secondBgColor
            saveButton.backgroundColor = person.secondBgColor
            
            addTextFieldView(name: password, yPos: Int(cardNum.frame.size.height) + 230, placeHolder: "Введите пароль...")
        default:
            break
        }
    }
    
    //Алерт
    func alertMsg(title: String, msg: String, end: Bool) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (bool) in
            if end {
                self.dismiss(animated: true, completion: nil)
            }
        }
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
    //ограничение длинны строки
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField ==  cardNum {
            let char = string.cString(using: String.Encoding.utf8)
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
            return textField.text!.count <= 3
        }
        return true
    }

}

extension SecondVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return proger.techArray.count
    }
    
    
}

extension SecondVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        tech.text = proger.techArray[row]
        return proger.techArray[row]
    }
}
