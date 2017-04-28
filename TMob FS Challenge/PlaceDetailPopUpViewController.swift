//
//  PlaceDetailPopUpViewController.swift
//  TMob FS Challenge
//
//  Created by Huseyin Yusuf on 29/04/2017.
//  Copyright © 2017 Huseyin Yusuf. All rights reserved.
//

import UIKit

class PlaceDetailPopUpViewController: UIViewController {
    @IBOutlet weak var popUpView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.black.withAlphaComponent(0.6)
        popUpView.layer.cornerRadius=12
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func BackgroundClicked(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion:{})
    }
}
