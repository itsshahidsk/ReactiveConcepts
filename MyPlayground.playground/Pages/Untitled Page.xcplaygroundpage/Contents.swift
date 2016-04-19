//: [Previous](@previous)
/*

 Follwo this url bro
https://www.weheartswift.com/closures/ 
 
 
 */


import Foundation


var hello: (Int) -> String = { (number) in
    return "The number is \(number)"
}

public var noparams: () -> () =  {
    print("This is my closure")

}

print(hello(2))

noparams()


/***** Closures Can Capture Values *******///////
//variable in a global context
var number = 0
var addOne = {
    number += 1
}

var printNumber = {
    print(number)
}

printNumber()
addOne()
printNumber()
addOne()
addOne()
addOne()
printNumber()


//Variable in a local context
func makeIterator(start start:Int ,step: Int) -> () -> Int {
    var i = start
    return {
        let currentValue = i
        i += step
        return currentValue
    }
}


var iterator = makeIterator(start:1, step: 1)
iterator()
iterator()



func applyKTimes(times k: Int,method: () -> ()) {
   
    for _ in 1...k {
        method()
    }
    
}

applyKTimes(times: 5) {
   print("shahid")
}


//Find the largest number
let numbers = [4,7,1,9,6,5,6,9]

print(numbers.reduce(0, combine: { (maxNumber, number) -> Int in
    if maxNumber > number {
        return maxNumber
    } else {
        return number
    }
}))


print(numbers.reduce(numbers[0]){
    if $0 > $1 {
        return $0
    } else {
        return $1
    }
})

let strings = ["we","heart","swift"]

print(strings.reduce(""){  (appendedString,value) in
    return appendedString + value + " "
})



var numbers2 = [1,2,3,4,5,6]

print( numbers2.sort({ (number1, number2) -> Bool in
    
    
    func countOfDivisorsFor(number: Int) -> Int{
        var numberOfDivisorsForFirstNumber = 0
        for k in 1...number {
            if number % k == 0 {
                numberOfDivisorsForFirstNumber += 1
            }
        }
        
        return numberOfDivisorsForFirstNumber
    }
    
    return countOfDivisorsFor(number1) < countOfDivisorsFor(number2)
}))



print( Array(1...6).filter{ $0 % 3 == 0 } .map{ $0 * $0} )















