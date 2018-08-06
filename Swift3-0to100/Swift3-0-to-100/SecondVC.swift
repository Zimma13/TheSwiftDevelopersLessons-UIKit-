//
//  SecondVC.swift
//  Swift3-0-to-100
//
//  Created by Zimma on 15.03.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var finalData = [Float]()
    
    var headerLbl = UILabel()
    var allProffitLblText = UILabel()
    var allProffitLblSumm = UILabel()
    var finalDataLblText = UILabel()
    var finalDataLblSumm = UILabel()
    var finalText = UILabel()
    var finalSumm = UILabel()
    
    var finalWordsText = UILabel()
    var okButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(finalData)
        
        let color = finalData[1] - finalData[0] > 0 ? UIColor.green : UIColor.red
        let finalWords = finalData[1] - finalData[0] > 0 ? "У Вас остануться деньги на жизнь ;)" : "Вы не сможете выплачивать кредит!"
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bgimg")!)
        self.view.backgroundColor?.withAlphaComponent(10)
        
        self.headerLbl.text = "Результаты расчетов:"
        self.headerLbl.textColor = UIColor.white
        self.headerLbl.font = UIFont(name: "Apple SD Gothic Neo", size: 24)
        self.headerLbl.frame = CGRect(x: 73, y: 110, width: 400, height: 24)
        
        self.allProffitLblText.text = "Ваши доходы составляют:"
        self.allProffitLblText.textColor = UIColor.white
        self.allProffitLblText.font = UIFont(name: "Apple SD Gothic Neo", size: 14)
        self.allProffitLblText.frame = CGRect(x: 20, y: 150, width: 400, height: 18)
        
        self.allProffitLblSumm.text = String(finalData[1])
        self.allProffitLblSumm.layer.cornerRadius = 5
        self.allProffitLblSumm.layer.masksToBounds = true
        self.allProffitLblSumm.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.allProffitLblSumm.textColor = color
        self.allProffitLblSumm.textAlignment = .center
        self.allProffitLblSumm.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        self.allProffitLblSumm.frame = CGRect(x: 210, y: 150, width: 100, height: 18)
        
        self.finalDataLblText.text = "Плата по кредиту в месяц:"
        self.finalDataLblText.textColor = UIColor.white
        self.finalDataLblText.font = UIFont(name: "Apple SD Gothic Neo", size: 14)
        self.finalDataLblText.frame = CGRect(x: 20, y: 190, width: 400, height: 18)
        
        self.finalDataLblSumm.text = String(finalData[0])
        self.finalDataLblSumm.layer.cornerRadius = 5
        self.finalDataLblSumm.layer.masksToBounds = true
        self.finalDataLblSumm.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.finalDataLblSumm.textColor = color
        self.finalDataLblSumm.textAlignment = .center
        self.finalDataLblSumm.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        self.finalDataLblSumm.frame = CGRect(x: 210, y: 190, width: 100, height: 18)
        
        self.finalText.text = "ИТОГО:"
        self.finalText.textColor = UIColor.white
        self.finalText.font = UIFont(name: "Apple SD Gothic Neo", size: 14)
        self.finalText.frame = CGRect(x: 20, y: 250, width: 400, height: 18)
        
        self.finalSumm.text = String(finalData[1] - finalData[0])
        self.finalSumm.layer.cornerRadius = 5
        self.finalSumm.layer.masksToBounds = true
        self.finalSumm.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.finalSumm.textColor = color
        self.finalSumm.textAlignment = .center
        self.finalSumm.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        self.finalSumm.frame = CGRect(x: 210, y: 250, width: 100, height: 18)
        
        self.finalWordsText.text = finalWords
        self.finalWordsText.textColor = .white
        self.finalWordsText.textAlignment = .center
        self.finalWordsText.layer.masksToBounds = true
        self.finalWordsText.layer.cornerRadius = 5
        self.finalWordsText.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        self.finalWordsText.frame = CGRect(x: 5, y: 310, width: 365, height: 50)
        
        self.okButton.setTitle("Вернуться", for: .normal)
        self.okButton.layer.borderColor = UIColor.white.cgColor
        self.okButton.layer.cornerRadius = 5
        self.okButton.layer.borderWidth = 1
        self.okButton.frame = CGRect(x: 120, y: 600, width: 140, height: 40)
        
        self.view.addSubview(self.headerLbl)
        self.view.addSubview(self.allProffitLblText)
        self.view.addSubview(self.allProffitLblSumm)
        self.view.addSubview(self.finalDataLblText)
        self.view.addSubview(self.finalDataLblSumm)
        self.view.addSubview(self.finalText)
        self.view.addSubview(self.finalSumm)
        self.view.addSubview(self.finalWordsText)
        self.view.addSubview(self.okButton)
        
        self.okButton.addTarget(self, action: #selector(pushTheBackButton), for: .touchUpInside)
        
    }
    
    @objc func pushTheBackButton(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
