//
//  MyPageViewController.swift
//  UIKit-Lesson 20
//
//  Created by Zimma on 21/08/2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    
    //MARK: - Variable
    var cars = [CarsHelper]()
    let firstCar = UIImage(named: "firstCar")
    let secondCar = UIImage(named: "secondCar")
    let thirdCar = UIImage(named: "thirdCar")
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Cars"
        
        let fCar = CarsHelper(name: "This is first car", image: firstCar!)
        let sCar = CarsHelper(name: "This is second car", image: secondCar!)
        let tCar = CarsHelper(name: "This is third car", image: thirdCar!)
        
        cars.append(fCar)
        cars.append(sCar)
        cars.append(tCar)
        
    }

    //MARK: - create vc
    lazy var arrayCarVC:  [CarViewController] = {
        var carsVC = [CarViewController]()
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
    }()
    
    //MARK: - init UIPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .pageCurl, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayCarVC[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MyPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayCarVC.index(of: viewController) {
            if index > 0 {
                return arrayCarVC[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil }
        if let index = arrayCarVC.index(of: viewController) {
            if index < arrayCarVC.count - 1 {
                return arrayCarVC[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrayCarVC.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
