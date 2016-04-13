//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


//Writing Generic Functions

func pairsFromDictionary<keyType, ValueType>(dictionary: [keyType: ValueType]) -> [(keyType,ValueType)] {
    return Array(dictionary)
}
    

let pairs = [ "minimum" : 1, "maximum" : 100]

let keyValuePairs = pairsFromDictionary(pairs)


struct Queue<Element: Equatable> {
    
    private var elements = [Element]()
    
    mutating func enqueue(element: Element) {
        elements.append(element)
    }
    
    mutating func dequeue() -> Element? {
     
        guard elements.isEmpty == false else {
            return nil
        }
        
        return elements.removeFirst()
    }
}



var myQueue = Queue<Int>()
myQueue.enqueue(5)
myQueue.enqueue(1)
myQueue.enqueue(6)
print(myQueue.dequeue())


func mid<T: Comparable>(array: [T]) -> T {
    return array.sort(<)[(array.count - 1)/2]
}

mid([6,3,4,8,9,0,100])


protocol  Summable {
    func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Summable {}
extension Double: Summable {}

func  adder<T: Summable>(x:T, y: T) -> T {
    return x + y
}


let adderInt = adder(10, y: 15)

extension Queue {
    func  peek() -> Element? {
        return elements.first
    }
    
    func homogenous() -> Bool {
        if let first = elements.first {
            return !elements.contains { $0 != first }
        }
        
        return true
    }
}























