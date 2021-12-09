//
//  MainViewVC.swift
//  project1
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class MainViewVC: UIViewController {

    private let lbl:UILabel = {
        let labl = UILabel()
        labl.text = "Royal Antiques"
        labl.font = UIFont(name: "Cochin", size: 25.0)
        labl.textAlignment = .left
        labl.textColor = .init(red: 0.244, green: 0.349, blue: 0.224, alpha: 1)
        return labl
    }()
    private let tool:UIToolbar = {
        let tul = UIToolbar()
        let search = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(opensearch))
        let about = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: #selector(openabout))
        let profile = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.compose, target: self, action: #selector(openprofile))
        tul.items = [search, about, profile]
        tul.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 0.3)
        tul.clipsToBounds = true
        tul.layer.cornerRadius = 18
        return tul
    }()
    @objc private func opensearch() {
        let op = SearchVC()
        navigationController?.pushViewController(op, animated: true)
    }
    @objc private func openabout() {
        let op = AboutVC()
        navigationController?.pushViewController(op, animated: true)
    }
    @objc private func openprofile() {
        let op = ProfileVC()
        navigationController?.pushViewController(op, animated: true)
      
    }
    private let img:UIImageView = {
        let imgx = UIImageView()
        imgx.layer.cornerRadius = 8
        imgx.clipsToBounds = true
        return imgx
    }()
    private let pv:UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = 4
        page.addTarget(self, action: #selector(pagy), for: .valueChanged)
        page.pageIndicatorTintColor = .darkGray
        page.currentPageIndicatorTintColor = .cyan
        return page
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
    @objc private func pagy() {
        let cp = pv.currentPage
        if(cp == 0){
            img.image = UIImage(named: "1")
        }
        else if(cp == 1){
            img.image = UIImage(named: "2")
        }
        else if(cp == 2){
            img.image = UIImage(named: "3")
        }
        else if(cp == 3){
            img.image = UIImage(named: "4")
        }
    }
    private let tab:UITabBar = {
        let tb = UITabBar()
        let a = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostViewed, tag: 0)
        let b = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.featured, tag: 1)
        let c = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.downloads, tag: 2)
        tb.items = [a, b, c]
        tb.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        tb.layer.cornerRadius = 30
        tb.clipsToBounds = true
        tb.selectedItem = a
        return tb
    }()
    private let prog:UIProgressView = {
        let prg = UIProgressView()
        prg.setProgress(0.0, animated: true)
        return prg
    }()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 6.0) {
            self.prog.setProgress(1.0, animated: true)
        }
        let seconds = 6.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.prog.isHidden = true
            self.view.addSubview(self.lbl)
            self.view.addSubview(self.tool)
            self.view.addSubview(self.tab)
            self.view.addSubview(self.img)
            self.view.addSubview(self.pv)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        view.addSubview(prog)
        assignbackground()
        pagy()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lbl.frame = CGRect(x: 100, y: 90, width: view.width/2, height: 40)
        tool.frame = CGRect(x: view.width/2+70, y: 100, width: view.width/3-10, height: 40)
        img.frame = CGRect(x: 10, y: 140, width: view.width-20, height: 200)
        pv.frame = CGRect(x: 80, y: 310, width: view.width-160, height: 20)
        prog.frame = CGRect(x: 50, y: view.height/2, width: view.width-100, height: 20)
        tab.frame = CGRect(x: 10, y: view.height-70, width: view.width-20, height: 60)
    }
}
