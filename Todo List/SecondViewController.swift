//
//  SecondViewController.swift
//  Todo List
//
//  Created by Yadel Abraham 10/19/16.
//  Copyright © 2016 Yadel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
 
    
    @IBOutlet var item: UITextField!
    @IBAction func add(_ sender: AnyObject) {
        toDoList.append(item.text!)
        
        item.text = ""
        //Pemanent storage
        UserDefaults.standard.set(toDoList, forKey: "toDoList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //allow keyboard controll
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldRetrun(_ textField: UITextField!)-> Bool {
        item.resignFirstResponder()
        return true
    }


}

