//: Playground - noun: a place where people can play

import Cocoa

protocol ExerciseType: CustomStringConvertible {
    var name: String { get}
    var caloriesBurned: Double { get }
    var minutes: Double { get }
    var title: String { get }
    
}

extension ExerciseType {
    var description: String {
        return "Exercise(\(name), burned \(caloriesBurned) calories in \(minutes) minutes)"
    }
}

struct ElipticalTrainer: ExerciseType {
    let name = "Eliptical Machine"
    let title = "Go fast Elliptical Machine 3000"
    let caloriesBurned: Double
    let minutes: Double
}

let elipticalWorkout = ElipticalTrainer(caloriesBurned: 335, minutes: 30)

struct Treadmill: ExerciseType {
    let name = "Treadmill"
    let title = "Dust Collector"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
}

extension Treadmill {
    var description: String {
        return "Treadmill(\(caloriesBurned) calories and \(distanceInMiles) miles in \(minutes) minutes)"
    }
}

let runningWorkout = Treadmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)


extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}


print(elipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

print(elipticalWorkout)
print(runningWorkout)



extension SequenceType where Generator.Element == ExerciseType {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [ExerciseType] = [elipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())


for exercise in mondayWorkout {
    print(exercise.title)
}

