//
//  ViewController.swift
//  project1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let lbl:UILabel = {
        let labl = UILabel()
        labl.text = "Royal Antiques"
        labl.font = UIFont(name: "Cochin", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return labl
    }()
    private let txt1:UITextField = {
        let txt = UITextField()
        txt.font = UIFont(name: "", size: 20.0)
        txt.backgroundColor = UIColor.clear
        txt.textAlignment = .center
        txt.attributedPlaceholder = NSAttributedString(string: "USERNAME", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        txt.layer.cornerRadius = 8
        return txt
    }()
    private let txt2:UITextField = {
        let txt = UITextField()
        txt.font = UIFont(name: "", size: 20.0)
         txt.backgroundColor = UIColor.clear
        txt.textAlignment = .center
        txt.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        txt.layer.cornerRadius = 8
        return txt
    }()
    private let btn:UIButton = {
        let btnx = UIButton()
        btnx.setTitle("LOGIN", for: .normal)
        btnx.layer.cornerRadius = 8
        btnx.addTarget(self, action: #selector(loginclicked), for: .touchUpInside)
        btnx.backgroundColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return btnx
    }()
    @objc private func loginclicked() {
        let vc = MainViewVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    private let rlink:UIButton = {
        let btn = UIButton()
        btn.setTitle("New User Registeration !", for: .normal)
        btn.setTitleColor(.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(registeration), for: .touchUpInside)
        return btn
    }()
    @objc private func registeration() {
        let vc = RgisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        view.addSubview(lbl)
        view.addSubview(txt1)
        view.addSubview(txt2)
        view.addSubview(btn)
        view.addSubview(rlink)
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
        lbl.frame = CGRect(x: 20, y: Int(view.height/4)+30, width: Int(view.width-40), height: 40)
        txt1.frame = CGRect(x: 80, y: Int(view.height/4)+120, width: Int(view.width-160), height: 40)
        txt2.frame = CGRect(x: 80, y: Int(view.height/4)+180, width: Int(view.width-160), height: 40)
        btn.frame = CGRect(x: 80, y: Int(view.height/4)+240, width: Int(view.width-160), height: 40)
        rlink.frame = CGRect(x: 80, y: Int(view.height/4)+290, width: Int(view.width-160), height: 20)
    }
    


}

