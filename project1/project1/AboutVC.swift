//
//  AboutVC.swift
//  project1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    private let lbl:UILabel = {
        let labl = UILabel()
        labl.text = "Royal Antiques"
        labl.font = UIFont(name: "Cochin", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return labl
    }()
    private let tv:UITextView = {
        let tvs = UITextView()
        tvs.text = "Rate Us:)"
        tvs.textColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        tvs.font = UIFont(name: "Cochin", size: 22.0)
        tvs.backgroundColor = .none
        return tvs
    }()
    private let lblr:UILabel = {
        let labl = UILabel()
        labl.text = "Rate US"
        labl.font = UIFont(name: "Cochin", size: 20.0)
        labl.textAlignment = .left
        labl.textColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return labl
    }()
    private let sldr:UISlider = {
        let slr = UISlider()
        slr.minimumValue = 1.0
        slr.maximumValue = 10.0
        slr.addTarget(self, action: #selector(rate), for: .valueChanged)
        return slr
    }()
    @objc private func rate() {
        lblsr.text = String(Int(sldr.value))
    }
    private let lblsr:UILabel = {
        let labl = UILabel()
        labl.text = ""
        labl.font = UIFont(name: "Cochin", size: 20.0)
        labl.textAlignment = .left
        labl.textColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return labl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lbl)
        view.addSubview(tv)
        view.addSubview(sldr)
        view.addSubview(lblr)
        view.addSubview(lblsr)
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
        lbl.frame = CGRect(x: 45, y: 150, width: view.width-50, height: 40.0)
        tv.frame = CGRect(x: 45, y: lbl.frame.maxY+40, width: view.width-50, height: 140)
        lblr.frame = CGRect(x: 45, y: tv.frame.maxY+20, width: view.width-50, height: 20)
        sldr.frame = CGRect(x: 45, y: lblr.frame.maxY+20, width: view.width-50, height: 20)
        lblsr.frame = CGRect(x: view.width/2, y: tv.frame.maxY+20, width: 60, height: 20)
    }

}
