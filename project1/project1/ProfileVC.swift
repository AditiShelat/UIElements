//
//  ProfileVC.swift
//  project1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    private let lblswitch:UILabel = {
        let labl = UILabel()
        labl.text = "turn On Notification"
        labl.font = UIFont(name: "Cochin", size: 20.0)
        labl.textAlignment = .left
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        return labl
    }()
    private let swch:UISwitch = {
        let sitc = UISwitch()
        
        return sitc
    }()
    private let tv:UITextView = {
        let tvs = UITextView()
        tvs.text = "you can enable notification for new Products !"
        tvs.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        tvs.font = UIFont(name: "Cochin", size: 24.0)
        tvs.backgroundColor = .none
        return tvs
    }()
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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        view.addSubview(lblswitch)
        view.addSubview(swch)
        view.addSubview(tv)
        assignbackground()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lblswitch.frame = CGRect(x: 15, y: 100, width: view.width-30, height: 30)
        swch.frame = CGRect(x: view.width/2+100, y: 100, width: 60, height: 30)
        tv.frame = CGRect(x: 15, y: 150, width: view.width-30, height: 160)
    }

}
