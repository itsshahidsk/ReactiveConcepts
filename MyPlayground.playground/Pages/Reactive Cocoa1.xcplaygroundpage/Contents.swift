//: [Previous](@previous)

import Foundation
import ReactiveCocoa
import Result


//: [Next](@next)
//Streams, Transformations and Bindings
// Events four types - Next, Failed, Interrupted, Completed
//Only next sends values with what has changed
// Signals are generally used to represent event streams that are already in progress
//These cannot perform side effects
 // We need to observe signals 
//We can use pipe operator which returns a signal and an observer

//Signal Producer - Some one has to start these signals so that the observer can observe like the network request
//Depending on who started it - The requests are directed to that user

//We use SignalProducer.buffer() to generate these signals


let (mapSignal,mapObserver) = Signal<String,NoError>.pipe()

mapSignal.map { string  in string.uppercaseString }
        .observeNext { (upperCaseString) in print(upperCaseString)}

mapSignal.observeCompleted {
    print("Signal Completed")
}

mapObserver.sendNext("shahid")
mapObserver.sendNext("sharmila")
mapObserver.sendNext("Sk")
mapObserver.sendCompleted()


let (filteringSignal, filteringObserver) = Signal<Int,NoError>.pipe()
filteringSignal.filter { (number) -> Bool in
                    return number % 2 == 0 }
                .observeNext { (number) in
                    print(number) }
filteringObserver.sendNext(4)
filteringObserver.sendNext(3)


let (reduceSignal,reduceObserver) = Signal<Int,NoError>.pipe()
reduceSignal.reduce(0) { (sum, number) -> Int in
    return sum + number }
    .observeNext{print($0)}

reduceObserver.sendNext(1)
reduceObserver.sendNext(2)
reduceObserver.sendNext(3)
//reduceObserver.sendCompleted()



let (numbersSignal,numbersObserver) = Signal<Int,NoError>.pipe()
let (lettersSignal,lettersObserver) = Signal<String,NoError>.pipe()

let combinedSignal = combineLatest(numbersSignal, lettersSignal)

combinedSignal.observeNext { (next) in
    print(next)
}

//Note: Theresulting stream would send its value only after each of its individual signals has sent atleast one signal
numbersObserver.sendNext(10)
numbersObserver.sendNext(12)
lettersObserver.sendNext("s")
































