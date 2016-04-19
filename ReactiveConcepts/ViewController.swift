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

    
    
    @IBAction func searchForTerm(sender: AnyObject) {
        let array = Array(1...10).filter{ $0 % 2 == 0}
        binarySearch(array, searchKey: 8)

    }
    
    func binarySearch(sequence: [Int], searchKey:Int) {
        
        print(sequence.midIndex)
        let minValue = sequence[sequence.minIndex]
        let maxValue = sequence[sequence.maxIndex]
        let midValue = sequence[sequence.midIndex]
        
        guard midValue != searchKey else {
            print("we found your item \(searchKey)")
            return
        }
        
        guard searchKey < maxValue && searchKey > minValue else {
            print("we count not find your item")
            return
        }
        
        if midValue > searchKey {
            binarySearch(Array(sequence[sequence.minIndex...sequence.midIndex-1]), searchKey:searchKey)
        } else {
            binarySearch(Array(sequence[sequence.midIndex+1...sequence.maxIndex]), searchKey:searchKey)
        }
        
    }
}

extension Array {
    var midIndex: Int {
        guard self.count > 1 else {
            return 0
        }
        print("count is \(self.count)")
        return (self.count / 2) - 1
    }
    var minIndex: Int {
        return self.startIndex
    }
    var maxIndex: Int {
        return self.endIndex - 1
    }
    
}



