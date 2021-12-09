//
//  RgisterVC.swift
//  project1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class RgisterVC: UIViewController {

    private let lbl:UILabel = {
        let labl = UILabel()
        labl.text = "Royal Antiques"
        labl.font = UIFont(name: "Cochin", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return labl
    }()
    private let txt0:UITextField = {
        let txt = UITextField()
        txt.font = UIFont(name: "", size: 20.0)
         txt.backgroundColor = UIColor.clear
        txt.textAlignment = .center
        txt.attributedPlaceholder = NSAttributedString(string: "FULLNAME", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        txt.layer.cornerRadius = 8
        return txt
    }()
    
    private let txt1:UITextField = {
        let txt = UITextField()
        txt.font = UIFont(name: "", size: 20.0)
         txt.backgroundColor = UIColor.clear
        txt.textAlignment = .center
        txt.attributedPlaceholder = NSAttributedString(string: "E-MAIL", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
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
    private let txt3:UITextField = {
        let txt = UITextField()
        txt.font = UIFont(name: "", size: 20.0)
        txt.backgroundColor = UIColor.clear
        txt.attributedPlaceholder = NSAttributedString(string: "HEIGHT", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)])
        txt.layer.cornerRadius = 8
        return txt
    }()
   
    private let stepper:UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.backgroundColor = UIColor.clear
        stepper.addTarget(self, action: #selector(takeHeight), for: .valueChanged)
        stepper.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        return stepper
    }()
    private let btn:UIButton = {
        let btnx = UIButton()
        btnx.setTitle("REGISTER", for: .normal)
        btnx.layer.cornerRadius = 8
        btnx.addTarget(self, action: #selector(registerclicked), for: .touchUpInside)
        btnx.backgroundColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return btnx
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
    @objc private func registerclicked() {
        let vc = NewRegistrationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func takeHeight(){
        let height = stepper.value
        txt3.text = String(height)
        ActivityIndicatorView.isHidden = true
        ActivityIndicatorView.stopAnimating()
        
    }
    private let ActivityIndicatorView:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.color = UIColor.black
        activity.startAnimating()
        return activity
    }()
    private let rlink:UIButton = {
        let btn = UIButton()
        btn.setTitle("Already have a account?lets login!", for: .normal)
        btn.setTitleColor(.init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(registeration), for: .touchUpInside)
        return btn
    }()
    @objc private func registeration() {
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        view.addSubview(lbl)
        view.addSubview(txt0)
        view.addSubview(txt1)
        view.addSubview(txt2)
        view.addSubview(txt3)
        view.addSubview(stepper)
        view.addSubview(btn)
        view.addSubview(rlink)
        assignbackground()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lbl.frame = CGRect(x: 20, y: Int(view.height/5), width: Int(view.width-40), height: 40)
        txt0.frame = CGRect(x: 80, y: Int(view.height/4)+60, width: Int(view.width-160), height: 40)
        txt1.frame = CGRect(x: 80, y: Int(view.height/4)+120, width: Int(view.width-160), height: 40)
        txt2.frame = CGRect(x: 80, y: Int(view.height/4)+180, width: Int(view.width-160), height: 40)
        txt3.frame = CGRect(x: 80, y: Int(view.height/4)+240, width: Int(view.width-260), height: 40)
        stepper.frame = CGRect(x: 200, y: Int(view.height/4)+240, width: Int(view.width-160), height: 40)
        btn.frame = CGRect(x: 80, y: Int(view.height/4)+300, width: Int(view.width-160), height: 40)
        rlink.frame = CGRect(x: 20, y: Int(view.height/4)+340, width: Int(view.width-60), height: 20)
    }

}
