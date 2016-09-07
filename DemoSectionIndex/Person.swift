//
//  Person.swift
//  DemoSectionIndex
//
//  Created by Chung on 9/7/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import Foundation
class Person {
    static var arrFirstNameMen: [String]!
    
    static var arrFirstNameWomen: [String]!
    
    static var arrLastName: [String]!
    
    static var arrMiddleNameMen: [String]!
    
    static var arrMiddleNameWomen: [String]!
    
    static var arrNumb: [String]!
    
    static var arrFirstNumbPhone: [String]!
    
    var fullName: String!
    
    var lastName: String!
    
    var firstName: String!
    
    var middleName: String!
    
    var phone: String!
    
    var firstPhone: String!
    
    var lastPhone: String = ""
    
    static var isCheck: Bool = true
    
    init(){
        if  Person.isCheck == true {
            Person.arrNumb = ["1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "0"]
            Person.arrFirstNumbPhone = ["0162" , "0163" , "0164" , "096" , "097" , "093" , "094"]
            
            Person.arrFirstNameMen = ["Anh", "Bắc", "Biên", "Chung" , "Chiến" , "Chính" , "Công", "Dũng" , "Dương", "Đạt" , "Kiên" , "Long", "Thành"]
            Person.arrFirstNameWomen = ["An", "Ánh", "Dung", "Giang" , "Hằng" , "Khánh" , "Liên", "Mai" , "Nhung", "Oanh" , "Thủy" , "Phương", "Xuân"]
            Person.arrMiddleNameMen = ["Văn", "Đăng", "Bảo", "Bình" , "Minh" , "Khắc" , "Duy", "Kim"]
            Person.arrMiddleNameWomen = ["Thị" , "Ngọc" , "Thùy"]
            Person.arrLastName = ["Hoàng" , "Trần" , "Nguyễn" , "Đặng" , "Phạm" , "Trịnh" , "Đỗ" , "Đinh" , "Lê" , "Vũ"]
            Person.isCheck = false
        }
        let genderIndex = arc4random_uniform(2)
        
        if(genderIndex == 0){
            middleName = Person.arrMiddleNameWomen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameWomen.count)))]
            firstName = Person.arrFirstNameWomen[Int(arc4random_uniform(UInt32(Person.arrFirstNameWomen.count)))]
        }else{
            middleName = Person.arrMiddleNameMen[Int(arc4random_uniform(UInt32(Person.arrMiddleNameMen.count)))]
            firstName = Person.arrFirstNameMen[Int(arc4random_uniform(UInt32(Person.arrFirstNameMen.count)))]
        }
        lastName = Person.arrLastName[Int(arc4random_uniform(UInt32(Person.arrLastName.count)))]
        
        firstPhone = Person.arrFirstNumbPhone[Int(arc4random_uniform(UInt32(Person.arrFirstNumbPhone.count)))]
        
        for _ in 0...6 {
           self.lastPhone.appendContentsOf(Person.arrNumb[Int(arc4random_uniform(UInt32(Person.arrNumb.count)))])
        }
        phone = firstPhone + lastPhone
        
        fullName = lastName + " " + middleName + " " + firstName
        
    }
}
