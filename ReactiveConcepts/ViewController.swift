//
//  ViewController.swift
//  ReactiveConcepts
//
//  Created by Shahid on 4/11/16.
//  Copyright © 2016 Sk. All rights reserved.
//

import UIKit
import ReactiveCocoa


class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var submitButtonn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Streams - Tranformations - Bindings
        
        self.textField.rac_textSignal()
            .filter { (text) -> Bool in
            let textEntered = text as! String
            return textEntered.characters.count > 2 }
            .map({ (text) -> AnyObject in
                let textEnterred = text as! String
                return textEnterred.characters.count
            })
            .subscribeNext { (textCount) in
             print(textCount)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

