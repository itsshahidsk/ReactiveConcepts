//: [Previous](@previous)

import Foundation


var evenSum = Array(1...10)
              .filter { $0 % 2 == 0}
              .reduce(0) { (sum, number) in
                return sum + number
}

print(evenSum)

//Find maximum number using reduce

var maxNumber = [10,20,100,60].reduce(0) { (maxNumber, number)  in
    max(maxNumber, number)
}


let numbers = Array(1...10).reduce("Numbers:") { (resultString,number) in
    resultString + " \(number)"
}
print(numbers)


let digits = ["3","1","4","1"]

let number = digits.reduce(0) { (sum, stringValue)  in
    let intValue = Int(stringValue)!
    let newSum =  sum * 10 + intValue
    return newSum
}

print(number)

extension Array {
    func myReduce<T, U>(seed: U , combiner: (U,T) -> U ) -> U   {
        var current = seed
        for item in self {
            current = combiner(current,item as!  T)
        }
        return current
    }
}

let words = ["Cat","Chicken","Fish","Dog","Mouse","Guinea Pig","Monkey"]

typealias Entry = (Character,[String])

//Write the imperative Code
let indexArray = [Entry]()
let charactersArray = [Character]()

let letters = words.map { (animal)  in
  return Character(animal.substringToIndex(animal.startIndex.advancedBy(1)))
}


func distinct<T: Equatable>(source:[T]) -> [T] {
    var distinctArray = [T]()
    
    for element in source {
        if distinctArray.contains(element) == false  {
            distinctArray.append(element)

        }
    }
    return distinctArray
}

var newLetters = distinct(letters)
print(newLetters)


let index = newLetters.map { (character) -> Entry in
    return (character,words.filter({ (animal) -> Bool in
        return Character(animal.substringToIndex(animal.startIndex.advancedBy(1))) == character
    }))
}

print(index)







