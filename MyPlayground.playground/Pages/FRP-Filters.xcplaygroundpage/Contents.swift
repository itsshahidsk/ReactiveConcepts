//: [Previous](@previous)

import Foundation

var str = "Hello, playground"



func isEven(number:Int) -> Bool {
    return number % 2 == 0
}

var evens = Array(1...10).filter(isEven)

//NOTE: Functions are named closures

evens = Array(1...10).filter({ (number) -> Bool in
    return number % 2 == 0
})

//Higher order functions are funtions which you pass as the arguments to other functions
//First Class Functions - which can be treated as variables and can be assigned

func myFilter<T>(source:[T],predicate: (T) -> Bool) -> [T] {
    var results = [T]()
    
    for t in source {
        if predicate(t) {
            results.append(t)
        }
    }
    
    return results
}

extension Array {
    
func myFilter<T>(predicate: (T) -> Bool) -> [T] {
    var results = [T]()
    
    for  i in self {
        let t = i as! T
        if predicate(t) {
            results.append(t)
        }
    }
    
    return results
    }
}

evens = myFilter(Array(1...10)) { $0 % 2 == 0}
print(evens)

evens = Array(1...10).myFilter { $0 % 2 == 0 }
print(evens)
