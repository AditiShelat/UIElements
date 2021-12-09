//
//  SearchVC.swift
//  project1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    private let tv:UITextView = {
        let tvs = UITextView()
        tvs.text = "Royal Antiques"
        tvs.textColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
         tvs.backgroundColor = UIColor.clear
        tvs.font = UIFont(name: "Cochin", size: 22.0)
        tvs.textAlignment = .center
        return tvs
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        view.addSubview(tv)
        assignbackground()
        
    }
    func assignbackground(){
        let background = UIImage(named: "bg")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tv.frame = CGRect(x: 25, y: (view.height/2)-26, width: view.width-50, height: 90)
    }

}
