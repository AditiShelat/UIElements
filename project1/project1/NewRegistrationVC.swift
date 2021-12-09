//
//  NewRegistrationVC.swift
//  project1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewRegistrationVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    private let picker = UIPickerView()
    private let pickerdata = ["English","Hindi","Gujarati","Marathi","Tamil"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerdata.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerdata[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerdata[row])
    }

    private let prof:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "profile")
        img.layer.cornerRadius = 75
        return img
    }()
    private let btnprof:UIButton = {
        let btnx = UIButton()
        btnx.setTitle("Set Profile", for: .normal)
        btnx.layer.cornerRadius = 8
        btnx.addTarget(self, action: #selector(addprofile), for: .touchUpInside)
        btnx.backgroundColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return btnx
    }()
    @objc func addprofile() {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            prof.image = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    private let lbl:UILabel = {
        let labl = UILabel()
        labl.text = "Royal Antiques"
        labl.font = UIFont(name: "Cochin", size: 30.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return labl
    }()
    private let lbldob:UILabel = {
        let labl = UILabel()
        labl.text = "Date Of Birth"
        labl.font = UIFont(name: "Cochin", size: 20.0)
        labl.textAlignment = .left
        labl.textColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return labl
    }()
    private let dob:UIDatePicker = {
        let dt = UIDatePicker()
        dt.datePickerMode = .date
        dt.tintColor = .darkGray
        return dt
    }()
    private let lblgen:UILabel = {
        let labl = UILabel()
        labl.text = "Gender"
        labl.font = UIFont(name: "Cochin", size: 20.0)
        labl.textAlignment = .left
        labl.textColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return labl
    }()
    private let gen:UISegmentedControl = {
        let seg = UISegmentedControl()
        seg.insertSegment(withTitle: "Male", at: 0, animated: true)
        seg.insertSegment(withTitle: "Female", at: 1, animated: true)
        seg.insertSegment(withTitle: "Transgender", at: 2, animated: true)
        seg.selectedSegmentIndex = 0
        return seg
    }()
    private let lblpick:UILabel = {
        let labl = UILabel()
        labl.text = "Language Selection"
        labl.font = UIFont(name: "Cochin", size: 20.0)
        labl.textAlignment = .left
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        return labl
    }()
    private let btn:UIButton = {
        let btnx = UIButton()
        btnx.setTitle("Complete", for: .normal)
        btnx.layer.cornerRadius = 8
        btnx.addTarget(self, action: #selector(loginclicked), for: .touchUpInside)
        btnx.backgroundColor = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        return btnx
    }()
    @objc private func loginclicked() {
      
        btn.isHidden = true
        proc.frame = CGRect(x: 80, y: Int(view.height/4)+470, width: Int(view.width-160), height: 40)
        proc.startAnimating()
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.proc.stopAnimating()
            let vc = MainViewVC()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    private let proc:UIActivityIndicatorView = {
        let acty = UIActivityIndicatorView()
        acty.color = .init(red: 0.244, green: 0.329, blue: 0.224, alpha: 1)
        acty.hidesWhenStopped = true
        return acty
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
      
        view.addSubview(prof)
        view.addSubview(btnprof)
        view.addSubview(lbl)
        view.addSubview(lbldob)
        view.addSubview(dob)
        view.addSubview(lblgen)
        view.addSubview(gen)
        view.addSubview(lblpick)
        view.addSubview(picker)
        view.addSubview(btn)
        view.addSubview(proc)
        picker.dataSource = self
        picker.delegate = self
        assignbackground()
     
    }
  
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lbl.frame = CGRect(x: 20, y: Int(view.height/6), width: Int(view.width-40), height: 40)
        prof.frame = CGRect(x: Int(view.width/2)-75, y: Int(view.height/4)+10, width: 150, height: 150)
        btnprof.frame = CGRect(x: 125, y: Int(view.height/4)+150, width: Int(view.width-250), height: 30)
        lbldob.frame = CGRect(x: 80, y: Int(view.height/4)+200, width: Int(view.width-160), height: 20)
        dob.frame = CGRect(x: 80, y: Int(view.height/4)+220, width: Int(view.width-160), height: 40)
        lblgen.frame = CGRect(x: 80, y: Int(view.height/4)+270, width: Int(view.width-160), height: 20)
        gen.frame = CGRect(x: 80, y: Int(view.height/4)+300, width: Int(view.width-160), height: 40)
        lblpick.frame = CGRect(x: 80, y: Int(view.height/4)+350, width: Int(view.width-160), height: 20)
        picker.frame = CGRect(x: 80, y: Int(view.height/4)+380, width: Int(view.width-160), height: 40)
        btn.frame = CGRect(x: 80, y: Int(view.height/4)+440, width: Int(view.width-160), height: 40)
    }
    

   

}
