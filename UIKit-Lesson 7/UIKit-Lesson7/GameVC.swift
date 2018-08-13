//
//  GameVC.swift
//  UIKit-Lesson7
//
//  Created by Zimma on 12/06/2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    let lbl = UILabel()
    let firstThimble = UIImageView()
    let secondThimble = UIImageView()
    let thirdThimble = UIImageView()
    
    var choiceSegmentedControl = UISegmentedControl()
    let menuChoiceArray = ["first", "second", "third"]
    var randomNum = 0
    
    let startButton = UIButton()
    let exitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let viewSize = view.frame.size
        let imageWidth = Int(viewSize.width / 3) - 10
        
        //Lable about Win/Los
        lbl.frame = CGRect(x: 0, y: 80, width: Int(viewSize.width), height: 70)
        lbl.textAlignment = .center
        lbl.alpha = 0
        
        // all Lbl Thimble
        firstThimble.frame = CGRect(x: 10, y: 100, width: imageWidth, height: imageWidth * 2)
        firstThimble.contentMode = .scaleAspectFit
        secondThimble.frame = CGRect(x: imageWidth + 20, y: 100, width: imageWidth, height: imageWidth * 2)
        secondThimble.contentMode = .scaleAspectFit
        thirdThimble.frame = CGRect(x: imageWidth * 2 + 30, y: 100, width: imageWidth, height: imageWidth * 2)
        thirdThimble.contentMode = .scaleAspectFit
        
        //segmented control
        
        choiceSegmentedControl = UISegmentedControl(items: menuChoiceArray)
        choiceSegmentedControl.frame = CGRect(x: 10, y: (imageWidth * 2) + 150, width: Int(viewSize.width - 20), height: 30)
        choiceSegmentedControl.isMomentary = true
        choiceSegmentedControl.tintColor = #colorLiteral(red: 0.4735031128, green: 0.3625719547, blue: 0.5073950887, alpha: 1)
        
        //start Button
        startButton.frame = CGRect(x: Int(viewSize.width / 2 - 70), y: Int(viewSize.height - 200), width: 140, height: 40)
        startButton.layer.cornerRadius = 6
        startButton.setTitle("New Game", for: .normal)
        startButton.backgroundColor = #colorLiteral(red: 0.4735031128, green: 0.3625719547, blue: 0.5073950887, alpha: 1)
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = #colorLiteral(red: 0.3030637875, green: 0.02446530043, blue: 0.5, alpha: 1)
            
        //Exit Button
        exitButton.frame = CGRect(x: Int(viewSize.width / 2 - 70), y: Int(viewSize.height - 100), width: 140, height: 40)
        exitButton.layer.cornerRadius = 6
        exitButton.setTitle("Exit", for: .normal)
        exitButton.backgroundColor = #colorLiteral(red: 0.4735031128, green: 0.3625719547, blue: 0.5073950887, alpha: 1)
        exitButton.layer.borderWidth = 1
        exitButton.layer.borderColor = #colorLiteral(red: 0.3030637875, green: 0.02446530043, blue: 0.5, alpha: 1)
        
        randomNum = shuffleThimble()
        
        view.addSubview(lbl)
        view.addSubview(firstThimble)
        view.addSubview(secondThimble)
        view.addSubview(thirdThimble)
        view.addSubview(choiceSegmentedControl)
        
        
        view.addSubview(startButton)
        view.addSubview(exitButton)
        
        exitButton.addTarget(self, action: #selector(exitToMainView(button:)), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startPlay(button:)), for: .touchUpInside)
        choiceSegmentedControl.addTarget(self, action: #selector(choice(target:)), for: .valueChanged)
        
        
    }
    
    //choice
    @objc func choice(target: UISegmentedControl) {
        if target == self.choiceSegmentedControl {
            if target.selectedSegmentIndex == randomNum {
                switch target.selectedSegmentIndex {
                case 0:
                    firstThimble.image = UIImage(named: "open_thimble")
                case 1:
                    secondThimble.image = UIImage(named: "open_thimble")
                case 2:
                    thirdThimble.image = UIImage(named: "open_thimble")
                default:
                    break
                }
                lbl.alpha = 1
                lbl.text = "You Win!"
                lbl.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
                choiceSegmentedControl.alpha = 0
            } else {
                switch target.selectedSegmentIndex {
                case 0:
                    firstThimble.image = UIImage(named: "open_thimbleWithEmpty")
                case 1:
                    secondThimble.image = UIImage(named: "open_thimbleWithEmpty")
                case 2:
                    thirdThimble.image = UIImage(named: "open_thimbleWithEmpty")
                default:
                    break
                }
                lbl.alpha = 1
                lbl.text = "You Los! :("
                lbl.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
                choiceSegmentedControl.alpha = 0
            }
        }
    }
    
    //star button
    @objc func startPlay(button: UIButton){
        if button == startButton {
            self.lbl.alpha = 0
            self.randomNum = shuffleThimble()
            choiceSegmentedControl.alpha = 1
        }
    }
    
    //exit button
    @objc func exitToMainView(button: UIButton) {
        if button == exitButton {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func shuffleThimble() -> Int {
        
        let randomNum = Int.random(in: 1...3)
        var arrayToShuffle = ["firs_thimble", "second_thimble", "firs_thimble"]
        
        
        for _ in 1...5 {
            arrayToShuffle.shuffle()
        }
            
        firstThimble.image = UIImage(named: arrayToShuffle[0])
        secondThimble.image = UIImage(named: arrayToShuffle[1])
        thirdThimble.image = UIImage(named: arrayToShuffle[2])
        
        return randomNum
    }
}
