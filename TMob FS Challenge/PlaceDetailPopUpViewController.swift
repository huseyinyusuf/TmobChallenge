//
//  PlaceDetailPopUpViewController.swift
//  TMob FS Challenge
//
//  Created by Huseyin Yusuf on 29/04/2017.
//  Copyright © 2017 Huseyin Yusuf. All rights reserved.
//

import UIKit

class PlaceDetailPopUpViewController: UIViewController {
    @IBOutlet weak var venueImage: UIImageView!
    @IBOutlet weak var popUpView: UIView!
    var imageUrl=""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.black.withAlphaComponent(0.6)
        popUpView.tag=1;
        popUpView.clipsToBounds=true
        popUpView.layer.cornerRadius=20
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print(imageUrl)
        let Url=URL(string: imageUrl)
        FSH.session?.downloadImageAtURL(Url!) {
            (imageData, error) -> Void in
            if let imageData = imageData {
                let image = UIImage(data: imageData)
                self.venueImage.image=image
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view != popUpView{
                self.dismiss(animated: true, completion:{})
            }
        }
    }

}
