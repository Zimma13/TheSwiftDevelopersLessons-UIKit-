//
//  ThirdVC.swift
//  UIKit-Lesson-6
//
//  Created by Zimma on 21.05.2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class ThirdVC: UIViewController {
    
    let nameLbl = UILabel()
    let playrButton = UIButton()
    let exitButton = UIButton()
    
    let secondVC = SecondVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewSize = view.frame.size
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        //plyerButton
        playrButton.frame = CGRect(x: Int(viewSize.width / 2 - 70), y: 160, width: 140, height: 40)
        playrButton.setTitle("Плеер", for: .normal)
        playrButton.layer.cornerRadius = 6
        playrButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        playrButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        // lable
        nameLbl.frame = CGRect(x: 0, y: 0, width: viewSize.width, height: 150)
        nameLbl.center = view.center
        nameLbl.numberOfLines = 0
        nameLbl.textAlignment = .center
        nameLbl.text = "Игрок создан!\nИмя игрока: \(secondVC.plyar.name). \nНик игрока: \(secondVC.plyar.nik). \nПол игрока: \(secondVC.plyar.sex)"
        nameLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //Exit Button
        exitButton.frame = CGRect(x: Int(viewSize.width / 2 - 70), y: Int(viewSize.height - 160), width: 140, height: 40)
        exitButton.setTitle("Выйти", for: .normal)
        exitButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        exitButton.layer.cornerRadius = 6
        exitButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        
        view.addSubview(playrButton)
        view.addSubview(nameLbl)
        view.addSubview(exitButton)
        
        playrButton.addTarget(self, action: #selector(goToPlayar), for: .touchUpInside)
        exitButton.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
    }
    
    @objc func goToPlayar(_: UIButton) {
        let vc = PlayarVC()
        present(vc, animated: true, completion: nil)
    }
    
    @objc func goBack(_: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
