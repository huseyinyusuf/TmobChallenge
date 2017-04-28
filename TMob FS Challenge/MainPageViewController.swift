//
//  ViewController.swift
//  TMob FS Challenge
//
//  Created by Huseyin Yusuf on 28/04/2017.
//  Copyright © 2017 Huseyin Yusuf. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var searchButton: UIView!
    @IBOutlet weak var areaTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.layer.cornerRadius=5
        areaTextField.delegate=self
        locationTextField.delegate=self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        }


}

