//
//  ViewController.swift
//  Swift3-0-to-100
//
//  Created by Zimma on 15.03.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let headerLbl = UILabel()
    let summCreditLbl = UILabel()
    let persentCreditLbl = UILabel()
    let summInLbl = UILabel()
    let summOutLbl = UILabel()
    let monthLongLbl = UILabel()
    let checkMonthYearLbl = UILabel()
    let checkMonthLbl = UILabel()
    let checkYearLbl = UILabel()
    
    let switchFoChoise = UISwitch()
    
    let summCreditTxt = UITextField()
    let persentCreditTxt = UITextField()
    let summInTxt = UITextField()
    let summOutTxt = UITextField()
    let monthLongTxt = UITextField()
    
    let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //BackGround
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bgimg")!)
        
        //Header Lable
        self.headerLbl.text = "Расчет ежемесячных выплат по кредиту"
        self.headerLbl.textColor = UIColor.white
        self.headerLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 20.0)
        self.headerLbl.frame = CGRect(x: 10, y: 110, width: 400, height: 20)
        
        self.summCreditLbl.text = "Сумма кредита:"
        self.summCreditLbl.textColor = UIColor.white
        self.summCreditLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.summCreditLbl.frame = CGRect(x: 10, y: 150, width: 150, height: 20)
        
        self.persentCreditLbl.text = "Процент по кредиту:"
        self.persentCreditLbl.textColor = UIColor.white
        self.persentCreditLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.persentCreditLbl.frame = CGRect(x: 10, y: 190, width: 150, height: 20)
        
        self.summInLbl.text = "Сумма доходов:"
        self.summInLbl.textColor = UIColor.white
        self.summInLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.summInLbl.frame = CGRect(x: 10, y: 230, width: 150, height: 20)
        
        self.summOutLbl.text = "Сумма расходов:"
        self.summOutLbl.textColor = UIColor.white
        self.summOutLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.summOutLbl.frame = CGRect(x: 10, y: 270, width: 150, height: 20)
        
        self.monthLongLbl.text = "Срок в месяцах:"
        self.monthLongLbl.textColor = UIColor.white
        self.monthLongLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.monthLongLbl.frame = CGRect(x: 10, y: 310, width: 150, height: 20)
        
        self.summCreditTxt.backgroundColor = UIColor.white
        self.summCreditTxt.keyboardType = .numberPad
        self.summCreditTxt.layer.cornerRadius = 4
        self.summCreditTxt.textColor = UIColor.purple
        self.summCreditTxt.textAlignment = .center
        self.summCreditTxt.placeholder = "Введите сумму..."
        self.summCreditTxt.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.summCreditTxt.frame = CGRect(x: 170, y: 150, width: 150, height: 22)
        
        self.persentCreditTxt.backgroundColor = UIColor.white
        self.persentCreditTxt.keyboardType = .numberPad
        self.persentCreditTxt.layer.cornerRadius = 4
        self.persentCreditTxt.textColor = UIColor.purple
        self.persentCreditTxt.textAlignment = .center
        self.persentCreditTxt.placeholder = "Введите сумму..."
        self.persentCreditTxt.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.persentCreditTxt.frame = CGRect(x: 170, y: 190, width: 150, height: 22)
        
        self.summInTxt.backgroundColor = UIColor.white
        self.summInTxt.keyboardType = .numberPad
        self.summInTxt.layer.cornerRadius = 4
        self.summInTxt.textColor = UIColor.purple
        self.summInTxt.textAlignment = .center
        self.summInTxt.placeholder = "Введите сумму..."
        self.summInTxt.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.summInTxt.frame = CGRect(x: 170, y: 230, width: 150, height: 22)
        
        self.summOutTxt.backgroundColor = UIColor.white
        self.summOutTxt.keyboardType = .numberPad
        self.summOutTxt.layer.cornerRadius = 4
        self.summOutTxt.textColor = UIColor.purple
        self.summOutTxt.textAlignment = .center
        self.summOutTxt.placeholder = "Введите сумму..."
        self.summOutTxt.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.summOutTxt.frame = CGRect(x: 170, y: 270, width: 150, height: 22)
        
        self.monthLongTxt.backgroundColor = UIColor.white
        self.monthLongTxt.keyboardType = .numberPad
        self.monthLongTxt.layer.cornerRadius = 4
        self.monthLongTxt.textColor = UIColor.purple
        self.monthLongTxt.textAlignment = .center
        self.monthLongTxt.placeholder = "Введите сумму..."
        self.monthLongTxt.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.monthLongTxt.frame = CGRect(x: 170, y: 310, width: 150, height: 22)
        
        self.checkMonthYearLbl.text = "Проценты по кредиту указаны за:"
        self.checkMonthYearLbl.textColor = UIColor.white
        self.checkMonthYearLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.checkMonthYearLbl.frame = CGRect(x: 80, y: 360, width: 250, height: 20)
        
        self.checkMonthLbl.text = "За месяц"
        self.checkMonthLbl.textColor = UIColor.green
        self.checkMonthLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        self.checkMonthLbl.frame = CGRect(x: 90, y: 396, width: 100, height: 20)
        
        self.switchFoChoise.frame = .zero
        self.switchFoChoise.center = self.view.center
        self.switchFoChoise.onTintColor = UIColor.clear
        self.switchFoChoise.thumbTintColor = UIColor.green
        self.switchFoChoise.tintColor = UIColor.clear
        
        self.checkYearLbl.text = "За год"
        self.checkYearLbl.textColor = UIColor.white
        self.checkYearLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        self.checkYearLbl.frame = CGRect(x: 230, y: 396, width: 100, height: 20)
        
        self.startButton.titleLabel?.textColor = UIColor.white
        self.startButton.setTitle("Посчитать", for: .normal)
        self.startButton.layer.borderColor = UIColor.white.cgColor
        self.startButton.layer.cornerRadius = 5
        self.startButton.layer.borderWidth = 1
        self.startButton.frame = CGRect(x: 125, y: 450, width: 120, height: 30)
        
        
        self.view.addSubview(self.headerLbl)
        self.view.addSubview(self.summCreditLbl)
        self.view.addSubview(self.persentCreditLbl)
        self.view.addSubview(self.summInLbl)
        self.view.addSubview(self.summOutLbl)
        self.view.addSubview(self.monthLongLbl)
        
        self.view.addSubview(self.summCreditTxt)
        self.view.addSubview(self.persentCreditTxt)
        self.view.addSubview(self.summInTxt)
        self.view.addSubview(self.summOutTxt)
        self.view.addSubview(self.monthLongTxt)
        
        self.view.addSubview(self.checkMonthLbl)
        self.view.addSubview(self.checkMonthYearLbl)
        self.view.addSubview(self.checkYearLbl)
        self.view.addSubview(self.switchFoChoise)
        self.view.addSubview(self.startButton)
        
        self.switchFoChoise.addTarget(self, action: #selector(isOn(target:)), for: .valueChanged)
        self.startButton.addTarget(self, action: #selector(pushTheButton(sender:)), for: .touchUpInside)
        
    }
    
    @objc func isOn(target: UISwitch) {
        if target.isOn {
            self.checkMonthLbl.textColor = UIColor.white
            self.checkMonthLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 14)
            self.checkYearLbl.textColor = UIColor.green
            self.checkYearLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        } else {
            self.checkMonthLbl.textColor = UIColor.green
            self.checkMonthLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
            self.checkYearLbl.textColor = UIColor.white
            self.checkYearLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 14.0)
        }
    }
    
    @objc func pushTheButton (sender: UIButton) {
        
        var finalSummMain: Float = 0
        
        if switchFoChoise.isOn {
            finalSummMain = (Float(summCreditTxt.text!)! / Float(monthLongTxt.text!)!) + (Float(summCreditTxt.text!)! / Float(monthLongTxt.text!)!) * ((Float(persentCreditTxt.text!)! / 12) / 100)
        } else {
            finalSummMain = (Float(summCreditTxt.text!)! / Float(monthLongTxt.text!)!) + (Float(summCreditTxt.text!)! / Float(monthLongTxt.text!)!) * (Float(persentCreditTxt.text!)! / 100)
        }
        
        print(finalSummMain)
        
        let secondVC = SecondVC()
        secondVC.finalData.append(finalSummMain)
        secondVC.finalData.append(Float(self.summInTxt.text!)! - Float(self.summOutTxt.text!)!)
        print("First: \(secondVC.finalData[0])   Second: \(secondVC.finalData[1])")
        present(secondVC, animated: true, completion: nil)

    }

}

