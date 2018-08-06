//
//  ViewController.swift
//  UIKitLesson5-1
//
//  Created by Zimma on 01.05.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let choicePicker = UIPickerView()
    let startButton = UIButton()
    
    var profArray = ["Программист", "Клиент"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = view.frame.size
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        //Picker choice
        choicePicker.frame = CGRect(x: 0, y: 0, width: viewSize.width, height: 100)
        choicePicker.center = view.center
        
        choicePicker.dataSource = self
        choicePicker.delegate = self
        
        //Button to start
        startButton.frame = CGRect(x: Int(viewSize.width / 2 - 150), y: Int(viewSize.height - 130), width: 300, height: 50)
        startButton.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        startButton.setTitle("Регистрация", for: .normal)

        
        view.addSubview(choicePicker)
        view.addSubview(startButton)
        
        startButton.addTarget(self, action: #selector(goToSecondVC(_:)), for: .touchUpInside)
        
    }
    
    @objc func goToSecondVC(_: UIButton) {
        let vc = SecondVC()
        let x = profArray[choicePicker.selectedRow(inComponent: 0)]
        vc.whois = x
        present(vc, animated: true, completion: nil)
    }
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return profArray.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return profArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if profArray[row] == "Программист" {
            view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            startButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        } else if profArray[row] == "Клиент" {
            view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            startButton.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        } else {
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}
