//
//  SecondVC.swift
//  UIKit-Lesson-6
//
//  Created by Zimma on 21.05.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    let sexLbl = UILabel()
    let sexPicker = UIPickerView()
    let nameTextField = UITextField()
    let nikTextField = UITextField()
    let colorSlider = UISlider()
    
    let goBackButton = UIButton()
    let nextButton = UIButton()
    
    var plyar = Plyar()
    
    let sexArray = ["Male", "female", "I wasn't defined"]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        let viewSize = view.frame.size
        
        // Sex Lable
        sexLbl.frame = CGRect(x: 40, y: 150, width: 100, height: 40)
        sexLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sexLbl.text = "Ваш пол: "
        
        //Sex picker
        sexPicker.delegate = self
        sexPicker.dataSource = self
        sexPicker.frame = CGRect(x: 150, y: 120, width: 200, height: 100)
        
        //Name TextField
        nameTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nameTextField.frame = CGRect(x: 40, y: 250, width: viewSize.width - 80, height: 40)
        nameTextField.layer.cornerRadius = 6
        nameTextField.placeholder = "Введите Ваше имя..."
        
        //NikName TextField
        nikTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nikTextField.frame = CGRect(x: 40, y: 310, width: viewSize.width - 80, height: 40)
        nikTextField.layer.cornerRadius = 6
        nikTextField.placeholder = "Введите Ваш Ник..."
        
        //Color Slider
        colorSlider.frame = CGRect(x: 40, y: 430, width: view.bounds.width - 80, height: 10)
        colorSlider.value = 0
        colorSlider.minimumValue = 0
        colorSlider.maximumValue = 255
        
        //return button
        goBackButton.frame = CGRect(x: viewSize.width / 2 - 150, y: viewSize.height - 100, width: 140, height: 40)
        goBackButton.setTitle("Вернуться", for: .normal)
        goBackButton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        goBackButton.layer.borderWidth = 1
        goBackButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        goBackButton.layer.cornerRadius = 6
        
        //next button
        nextButton.frame = CGRect(x: viewSize.width / 2 + 10, y: viewSize.height - 100, width: 140, height: 40)
        nextButton.setTitle("Далее", for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        nextButton.layer.borderWidth = 1
        nextButton.layer.cornerRadius = 6
        nextButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.addSubview(sexLbl)
        view.addSubview(sexPicker)
        view.addSubview(nameTextField)
        view.addSubview(nikTextField)
        view.addSubview(colorSlider)
        
        view.addSubview(goBackButton)
        view.addSubview(nextButton)
        
        goBackButton.addTarget(self, action: #selector(goBack(button:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(goNext(button:)), for: .touchUpInside)
        colorSlider.addTarget(self, action: #selector(changeBGSider(slider:)), for: .valueChanged)
        
    }
    
    @objc func goBack(button: UIButton) {
        if button == goBackButton {
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func changeBGSider(slider: UISlider) {
        let colorVal = slider.value
        self.view.backgroundColor = UIColor(hue: CGFloat(colorVal / 255), saturation: 0.5, brightness: 1.0, alpha: 0.4)
        
    }
    
    @objc func goNext(button: UIButton) {
        if button == nextButton {
            if nameTextField.text != "" && nikTextField.text != "" {
                
                plyar.saveDataInUserDefault(name: nameTextField.text!, nik: nikTextField.text!, sexNum: sexPicker.selectedRow(inComponent: 0))
                
                //saveDataInUserDefault(name: nameTextField.text!, nik: nikTextField.text!, sex: "mail")
                let vc = ThirdVC()
                present(vc, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "eRRoR!", message: "Не все поля заполнены!", preferredStyle: .actionSheet)
                let ok = UIAlertAction(title: "oK", style: .default, handler: nil)
                alert.addAction(ok)
                present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension SecondVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sexArray.count
    }
    
    
}

extension SecondVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let name = sexArray[row]
        return name
    }
}
