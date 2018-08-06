//
//  ViewController.swift
//  UIKit-Lesson-6
//
//  Created by Zimma on 21.05.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let playarButton = UIButton()
    let dataOfPlyar = UILabel()
    let emailTextField = UITextField()
    let passTextField = UITextField()
    let enterButton = UIButton()

    let plyar = Plyar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = view.frame.size
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        //Playar Button
        playarButton.frame = CGRect(x: Int(viewSize.width / 2 - 70), y: 100, width: 140, height: 30)
        playarButton.layer.cornerRadius = 6
        playarButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        playarButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        playarButton.layer.borderWidth = 1.0
        playarButton.setTitle("Playar", for: .normal)
        playarButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        // data of plyar
        // lable
        dataOfPlyar.frame = CGRect(x: 0, y: 140, width: viewSize.width, height: 150)
        dataOfPlyar.numberOfLines = 0
        dataOfPlyar.textAlignment = .center
        dataOfPlyar.text = "Крайние данные игрока:\nИмя игрока: \(plyar.name). \nНик игрока: \(plyar.nik). \nПол игрока: \(plyar.sex)"
        dataOfPlyar.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        
        //e-mail TextField
        emailTextField.frame = CGRect(x: 60, y: viewSize.height / 2 - 50, width: viewSize.width - 120, height: 30)
        emailTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        emailTextField.layer.cornerRadius = 6
        emailTextField.placeholder = "Введите e-mail..."
        emailTextField.textAlignment = .center
        
        //password TextField
        passTextField.frame = CGRect(x: 60, y: viewSize.height / 2 + 50, width: viewSize.width - 120, height: 30)
        passTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        passTextField.layer.cornerRadius = 6
        passTextField.placeholder = "Введите пароль"
        passTextField.textAlignment = .center
        passTextField.isSecureTextEntry = true
        
        //Enter Button
        enterButton.frame = CGRect(x: Int(viewSize.width / 2 - 70), y: Int(viewSize.height - 100), width: 140, height: 40)
        enterButton.layer.cornerRadius = 6
        enterButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        enterButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        enterButton.layer.borderWidth = 1.0
        enterButton.setTitle("Войти", for: .normal)
        enterButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        enterButton.setTitleShadowColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        
        
        view.addSubview(playarButton)
        view.addSubview(dataOfPlyar)
        view.addSubview(enterButton)
        view.addSubview(passTextField)
        view.addSubview(emailTextField)

        
        enterButton.addTarget(self, action: #selector(goToSecondVC), for: .touchUpInside)
        playarButton.addTarget(self, action: #selector(goToPlayar(button:)), for: .touchUpInside)
    }
    
    @objc func goToSecondVC(button: UIButton) {
        if button == enterButton {
            if emailTextField.text != "" && passTextField.text != "" {
                let vc = SecondVC()
                present(vc, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "eRRoR!", message: "Не все поля заполнены!", preferredStyle: .actionSheet)
                let ok = UIAlertAction(title: "oK", style: .default, handler: nil)
                alert.addAction(ok)
                present(alert, animated: true, completion: nil)
            }
            
        }
    }
    
    @objc func goToPlayar(button: UIButton) {
        if button == playarButton {
            let vc = PlayarVC()
            present(vc, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
    }
    
}
