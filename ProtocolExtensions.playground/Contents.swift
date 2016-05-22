//: Playground - noun: a place where people can play

import Cocoa

protocol ExerciseType {
    var name: String { get}
    var caloriesBurned: Double { get }
    var minutes: Double { get }
    
}


struct ElipticalTrainer: ExerciseType {
    let name = "Eliptical Machine"
    let caloriesBurned: Double
    let minutes: Double
}

let elipticalWorkout = ElipticalTrainer(caloriesBurned: 335, minutes: 30)

struct Treadmill: ExerciseType {
    let name = "Treadmill"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
}

let runningWorkout = Treadmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)


extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}


print(elipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

