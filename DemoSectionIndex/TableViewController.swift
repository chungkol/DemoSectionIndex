//
//  TableViewController.swift
//  DemoSectionIndex
//
//  Created by Chung on 9/7/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayData: NSMutableArray!
    
    var dictContacts = NSMutableDictionary()
    
    var arrayKey: NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionIndexBackgroundColor = UIColor.whiteColor()
        self.tableView.sectionIndexColor = UIColor.redColor()
        //        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        arrayData = NSMutableArray()
        for i in 0...50 {
            arrayData.addObject(Person())
            let person = arrayData[i] as! Person
        }
        
        for element in arrayData {
            let person = element as! Person
            var firstLetter: String = (person.firstName as NSString!).substringToIndex(1)
            
            if firstLetter == "Đ" {
                firstLetter = "D"
            }
            if firstLetter == "Â" || firstLetter == "Á" {
                firstLetter = "A"
            }
            
            
            var arrForLetter: NSMutableArray!
            
            if (dictContacts.valueForKey(firstLetter) != nil) {
                arrForLetter = dictContacts.valueForKey(firstLetter) as! NSMutableArray
                arrForLetter.addObject(person)
                dictContacts.setValue(arrForLetter, forKey: firstLetter)
            }else{
                arrForLetter = NSMutableArray(object: person)
                dictContacts.setValue(arrForLetter, forKey: firstLetter)
            }
            
        }

        arrayKey = dictContacts.allKeys as! [String]
        arrayKey = arrayKey.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)))
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
  
    
 
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
   
        return arrayKey.count
    }
    // số phần tử trong 1 section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = arrayKey[section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        return (sectionPersons?.count)!
    }
    //Thêm title cho section
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayKey[section] as? String
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        
        let person = sectionPersons![indexPath.row] as! Person
        cell?.textLabel?.text = person.fullName
        cell?.detailTextLabel?.text = person.phone
        
        return cell!
    }
    //thêm danh sách section
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arrayKey as? [String]
    }
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //set màu bg cho section
        view.tintColor = UIColor.grayColor()
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        //màu cho chữ của section
        header.textLabel?.textColor = UIColor.whiteColor()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailViewController()
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        
        let person = sectionPersons![indexPath.row] as! Person
        
        detailVC.person = person
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
}
