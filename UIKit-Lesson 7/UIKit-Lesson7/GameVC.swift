//
//  GameVC.swift
//  UIKit-Lesson7
//
//  Created by Zimma on 12/06/2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    let exitButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = view.frame.size
        
        //Exit Button
        exitButton.frame = CGRect(x: Int(viewSize.width / 2 - 70), y: Int(viewSize.height - 100), width: 140, height: 40)
        exitButton.layer.cornerRadius = 6
        exitButton.setTitle("Exit", for: .normal)
        exitButton.backgroundColor = #colorLiteral(red: 0.4735031128, green: 0.3625719547, blue: 0.5073950887, alpha: 1)
        exitButton.layer.borderWidth = 1
        exitButton.layer.borderColor = #colorLiteral(red: 0.3030637875, green: 0.02446530043, blue: 0.5, alpha: 1)
        
        view.addSubview(exitButton)
        
        exitButton.addTarget(self, action: #selector(exitToMainView(button:)), for: .touchUpInside)
        
    }
    
    @objc func exitToMainView(button: UIButton) {
        if button == exitButton {
            dismiss(animated: true, completion: nil)
        }
    }
}
