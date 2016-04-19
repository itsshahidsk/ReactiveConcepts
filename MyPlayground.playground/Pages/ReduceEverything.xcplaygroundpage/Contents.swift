//: [Previous](@previous)

import Foundation

let persons:[[String: AnyObject]] = [["name": "Carl Saxon", "city": "New York, NY", "age": 44],
                                      ["name": "Travis Downing", "city": "El Segundo, CA", "age": 34],
                                      ["name": "Liz Parker", "city": "San Francisco, CA", "age": 32],
                                      ["name": "John Newden", "city": "New Jersey, NY", "age": 21],
                                      ["name": "Hector Simons", "city": "San Diego, CA", "age": 37],
                                      ["name": "Brian Neo", "age": 27]]


//Flat map in swift automatically ignores Nil Optionals


func infoFromState(state state: String, persons: [[String: AnyObject]])
    -> Int {
        return persons.flatMap( { $0["city"]?.componentsSeparatedByString(", ").last })
            .filter({$0 == state})
            .count
}

print(infoFromState(state:"CA", persons:persons))

let sumOfIntegers = Array(1...10).reduce(0) { (sum,number) -> Int in
    return sum + number
}

print(sumOfIntegers)

let sumOfEvenIntegers = Array(1...10).reduce(0) { (sum, number) -> Int  in
    if number % 2 == 0  {
        return sum + number
    }
    return sum
}

print(sumOfEvenIntegers)

//Use reduce more often that using the filter and map. The array traversal happens quite a number of times if you happen to move it 