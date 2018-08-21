//
//  ViewController.swift
//  UIKit-Lesson 18
//
//  Created by Zimma on 18/08/2018.
//  Copyright © 2018 Zimma. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate{

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var undoTbItem: UIBarButtonItem!
    @IBOutlet weak var redoTbItem: UIBarButtonItem!
    @IBOutlet weak var refrashTbItem: UIBarButtonItem!
    
    var progresBar = UIProgressView()
    
    var newUrl = "https://ya.ru"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    
    @IBAction func canGoBack(_ sender: UIBarButtonItem) {
        if myWebView.canGoBack {
            myWebView.stopLoading()
            myWebView.goBack()
        }
    }
    
    @IBAction func canGoForward(_ sender: UIBarButtonItem) {
        if myWebView.canGoForward {
            myWebView.stopLoading()
            myWebView.goForward()
        }
        
    }
    @IBAction func openSite(_ sender: Any) {
        let alert = UIAlertController(title: "Введите адрес сайта", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            
        }
        
        let okButton = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            let new = "https://\((alert.textFields?.first?.text)!)"
            
            self.newUrl = new
            print(self.newUrl)
            self.newSite()
            
            
        }
        let cancelButton = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    @IBAction func refresh(_ sender: Any) {
        myWebView.stopLoading()
        myWebView.reload()
    }
    
    func newSite() {
        if let url = URL(string: newUrl) {
            let request = URLRequest(url: url)
            myWebView.load(request)
        }
    }
    
    func start() {
        newSite()
        
        myWebView.uiDelegate = self
        myWebView.navigationDelegate = self
        
        progresBar = UIProgressView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        progresBar.progress = 0.0
        progresBar.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        myWebView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: NSKeyValueObservingOptions.new, context: nil)
        myWebView.addSubview(progresBar)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progresBar.alpha = 1
            progresBar.setProgress(Float(myWebView.estimatedProgress), animated: true)
            
            if myWebView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 1.0, delay: 0.1, options: .curveEaseInOut, animations: {
                    self.progresBar.alpha = 0
                }) { (finished: Bool) in
                    self.progresBar.progress = 0
                }
            }
            
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        navigationItem.title = myWebView.title
        
        if myWebView.canGoBack {
            undoTbItem.isEnabled = true
        }
        if myWebView.canGoForward {
            redoTbItem.isEnabled = true
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        undoTbItem.isEnabled = false
        redoTbItem.isEnabled = false
    }
}

extension String {
    mutating func until(_ string: String) {
        var components = self.components(separatedBy: string)
        self = components[0]
    }
}
