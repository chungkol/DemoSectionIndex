//
//  DetailViewController.swift
//  DemoSectionIndex
//
//  Created by Chung on 9/7/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var person = Person()
    var labelName = UILabel()
    var lbMobile = UILabel()
    var lbPhone = UILabel()
    var imMes = UIImageView()
    var imCall = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        self.labelName.frame = CGRectMake(30, 100, 300, 50)
        self.labelName.font = UIFont.boldSystemFontOfSize(25)
        self.labelName.text = person.fullName
        self.view.addSubview(labelName)
        
        self.lbMobile.frame = CGRectMake(30, 200, 200, 30)
        self.lbMobile.font = UIFont.boldSystemFontOfSize(15)
        self.lbMobile.text = "Mobile"
        self.view.addSubview(lbMobile)
        
        self.lbPhone.frame = CGRectMake(30, 220, 200, 30)
        self.lbPhone.font = UIFont.boldSystemFontOfSize(15)
        self.lbPhone.text = person.phone
        self.view.addSubview(lbPhone)
        
        self.imMes.frame = CGRectMake(300, 200, 40, 40)
        self.imMes.image = UIImage(named: "mess")
        self.imMes.contentMode = .ScaleAspectFit
        self.view.addSubview(imMes)
        
        self.imCall.frame = CGRectMake(360, 200, 40, 40)
        self.imCall.image = UIImage(named: "call")
        self.imCall.contentMode = .ScaleAspectFit
        self.view.addSubview(imCall)
        
        imMes.userInteractionEnabled = true
        imMes.multipleTouchEnabled = true

        imCall.userInteractionEnabled = true
        imCall.multipleTouchEnabled = true

        let tapMess = UITapGestureRecognizer(target: self, action: Selector("tapMess:"))
        tapMess.numberOfTapsRequired = 1
        imMes.addGestureRecognizer(tapMess)
        
        let tapCall = UITapGestureRecognizer(target: self, action: Selector("tapCall:"))
        tapCall.numberOfTapsRequired = 1
        imCall.addGestureRecognizer(tapCall)
        
    }
    
    func tapMess(gesture: UITapGestureRecognizer){
       print("Mes")
        
    }
    func tapCall(gesture: UITapGestureRecognizer){
        print("Call")
        
    }
    
    
}
