//
//  ViewController.swift
//  UIKit-Lesson 20
//
//  Created by Zimma on 21/08/2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    //MARK: - Image
    private let carImg: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: - label
    private let nameLbl: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subView: [UIView] = [self.carImg, self.nameLbl]
    
    //MARK: - Init
    init(carWith: CarsHelper) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.purple
        edgesForExtendedLayout = []
        
        carImg.image = carWith.image
        nameLbl.text = carWith.name
        
        for view in subView { self.view.addSubview(view) }
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: carImg, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImg, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImg, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: carImg, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameLbl, attribute: .top, relatedBy: .equal, toItem: carImg, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: nameLbl, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
