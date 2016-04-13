//: Playground - noun: a place where people can play

import Foundation

enum RideType {
    case Family
    case Kids
    case Thrill
    case Scary
    case Relaxing
    case Water
}


struct  Ride {
    let name: String
    let types: Set<RideType>
    let waitTime: Double
}

let parkRides = [
    Ride(name: "Raging Rapids", types: [.Family, .Thrill, .Water], waitTime: 45.0),
    Ride(name: "Crazy Funhouse", types: [.Family], waitTime: 10.0),
    Ride(name: "Spinning Tea Cups", types: [.Kids], waitTime: 15.0),
    Ride(name: "Spooky Hollow", types: [.Scary], waitTime: 30.0),
    Ride(name: "Thunder Coaster", types: [.Family, .Thrill], waitTime: 60.0),
    Ride(name: "Grand Carousel", types: [.Family, .Kids], waitTime: 15.0),
    Ride(name: "Bumper Boats", types: [.Family, .Water], waitTime: 25.0),
    Ride(name: "Mountain Railroad", types: [.Family, .Relaxing], waitTime: 0.0)
]


func waitTimeIsShort(ride:Ride) -> Bool {
    return ride.waitTime < 15.0
}

var shortWaitTimeRides = parkRides.filter(waitTimeIsShort)
print(shortWaitTimeRides)

var shortWaitTimeRides1 = parkRides.filter { (ride) -> Bool in
    return  ride.waitTime < 15.0
}


var sortedTimeRides = parkRides.sort { (ride1, ride2) -> Bool in
    ride1.waitTime < ride2.waitTime
}

print("Hello **** \(sortedTimeRides)")

let rideNames = parkRides.map { (ride) -> String   in
    return ride.name
}

let rideNames2 = parkRides.map{ $0.name }.sort { (name1, name2) -> Bool in
    name1 < name2
}

let rideNames1 = parkRides.map{ $0.name }

print(rideNames.sort(<))
print(rideNames2)


let  averageRideTiems = parkRides.reduce(0) { (average, ride) -> Double in  return ride.waitTime/Double(parkRides.count) + average
}

extension Ride: Comparable {}

func < (lhs:Ride, rhs: Ride) -> Bool {
    return lhs.waitTime < rhs.waitTime
}

func == (lhs: Ride, rhs: Ride) -> Bool {
    return lhs.name == rhs.name
}


