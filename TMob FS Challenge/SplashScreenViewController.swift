//
//  SplashScreenViewController.swift
//  TMob FS Challenge
//
//  Created by Huseyin Yusuf on 28/04/2017.
//  Copyright © 2017 Huseyin Yusuf. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Method to delay splashcreen 2 seconds before start
        perform(#selector(SplashScreenViewController.SplashScreenDelay),with:nil,afterDelay:2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SplashScreenDelay(){
        self.performSegue(withIdentifier: "mainPageSague", sender: self)
    }
   
}
