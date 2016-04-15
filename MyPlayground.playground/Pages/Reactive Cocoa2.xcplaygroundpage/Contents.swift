//: [Previous](@previous)

import Foundation
import ReactiveCocoa
import Result

//Flatten in reactive cocoa
////******** Merge *********///
//
//let (producerA,lettersObserver) = SignalProducer<String,NoError>.buffer(5)
//let (producerB,numbersObserver) = SignalProducer<String,NoError>.buffer(5)
//
//let (signal,observer) = SignalProducer<SignalProducer<String,NoError>,NoError>.buffer(5)
//signal.flatten(.Merge).startWithNext { (next) in
//    print(next)
//}
//
//observer.sendNext(producerA)
//observer.sendNext(producerB)
//observer.sendCompleted()
//
//lettersObserver.sendNext("a")    // prints "a"
//numbersObserver.sendNext("1")    // prints "1"
//lettersObserver.sendNext("b")    // prints "b"
//numbersObserver.sendNext("2")    // prints "2"
//lettersObserver.sendNext("c")    // prints "c"
//numbersObserver.sendNext("3")
//numbersObserver.sendNext("6")

//Concat Strategy doesnot send signals until one of them is complete

let (numbersSignal,numbersObserver) = SignalProducer<String,NoError>.buffer(5)
let (letterSignal,lettersObserver) = SignalProducer<String,NoError>.buffer(7)

/*
 
let (concatSignal,concatObserver) = SignalProducer<SignalProducer<String,NoError>,NoError>.buffer(5)


concatSignal.flatten(.Concat).startWithNext { (next) in
    print(next)
}

concatObserver.sendNext(numbersSignal)
concatObserver.sendNext(letterSignal)
concatObserver.sendCompleted()

numbersObserver.sendNext("1")
lettersObserver.sendNext("A")
lettersObserver.sendNext("B")
lettersObserver.sendNext("C")
lettersObserver.sendNext("D")
lettersObserver.sendNext("E")
lettersObserver.sendNext("F")
lettersObserver.sendNext("G")
numbersObserver.sendNext("2")
numbersObserver.sendCompleted()   */


//******** Latest Signal *******//
//Latest sends signals of the latest signal it is observing right now -

let (latestSignal,latestObserver) = SignalProducer<SignalProducer<String,NoError>,NoError>.buffer(5)

//latestSignal.flatMap(.Latest) { (newSignal) -> Signal<String, NoError> in
//    return newSignal
//}
//latestSignal.flatMap(.Latest, transform: )

//latestSignal.flatten(.Latest).startWithNext { (next) in
//    print(next)
//}
//
//latestObserver.sendNext(numbersSignal)
//latestObserver.sendNext(letterSignal)
//numbersObserver.sendNext("1")
//lettersObserver.sendNext("A")


//NOTE: 

/*
Flat map is used to flatten the innersignal to give out its result rather than subscribing it to it again
*/



