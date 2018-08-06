//
//  ViewController.swift
//  UIKit-Lesson7
//
//  Created by Zimma on 12.06.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let img = UIImageView()
    let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let viewSize = view.frame.size
        
        //Game logo
        img.frame = CGRect(x: 0, y: 0, width: Int(viewSize.width), height: Int(viewSize.width - 40))
        img.image = UIImage(named: "logoImg")
        img.contentMode = .scaleAspectFit
        
        img.center = view.center
        
        //Start button
        startButton.frame = CGRect(x: Int(viewSize.width / 2 - 70), y: Int(viewSize.height - 100), width: 140, height: 40)
        startButton.setTitle("Start!", for: .normal)
        startButton.backgroundColor = #colorLiteral(red: 0.4735031128, green: 0.3625719547, blue: 0.5073950887, alpha: 1)
        startButton.layer.cornerRadius = 6
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = #colorLiteral(red: 0.3030637875, green: 0.02446530043, blue: 0.5, alpha: 1)
        
        
        view.addSubview(img)
        view.addSubview(startButton)
        
        startButton.addTarget(self, action: #selector(startGame(button:)), for: .touchUpInside)
        
    }

    @objc func startGame(button: UIButton) {
        if button == startButton {
            let vc = GameVC()
            present(vc, animated: true, completion: nil)
        }
    }

}

