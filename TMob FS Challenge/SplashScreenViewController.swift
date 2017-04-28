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
        
        perform(#selector(SplashScreenViewController.SplashScreenDelay),with:nil,afterDelay:2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func SplashScreenDelay(){
        self.performSegue(withIdentifier: "mainPageSague", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
