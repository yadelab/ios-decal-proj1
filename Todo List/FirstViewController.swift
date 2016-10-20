//
//  FirstViewController.swift
//  Todo List
//
//  Created by Yadel Abraham on 10/19/16.
//  Copyright © 2016 Yadel. All rights reserved.
//

import UIKit

//acessible to other view controller
var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    

    @IBOutlet var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "toDoList") != nil {
            toDoList = UserDefaults.standard.object(forKey: "toDoList") as! [String]
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of items in our todolist
        return toDoList.count
    }
   
    //
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[(indexPath as NSIndexPath).row]
        return cell
        
    }
    
    //editing item --deleting swipe to the left
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            toDoList.remove(at: (indexPath as NSIndexPath).row)
            
            UserDefaults.standard.set(toDoList, forKey: "toDoList")
            toDoListTable.reloadData()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        toDoListTable.reloadData()
    }

}

