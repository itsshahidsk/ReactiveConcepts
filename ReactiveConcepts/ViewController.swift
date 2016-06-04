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

        textField.rac_textSignal().filter{ (text) -> Bool in
            let enteredText =  text as? String
            return enteredText?.characters.count > 4

        }.map({ (text) -> AnyObject in
            let enteredText = text as? String
            return (enteredText?.characters.count)!
        }).subscribeNext { (charactersCount) in
            let countCharacters = charactersCount as? Int
            print(countCharacters)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchForTerm(sender: AnyObject) {
        //Click of a button lands here
        print("click of a button lands here with text \(textField.text)")

    }
    
}


