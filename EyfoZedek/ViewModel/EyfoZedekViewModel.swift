//
//  EyfoZedekViewModel.swift
//  EyfoZedek
//
//  Created by Andrey Safronov on 05/02/2024.
//

import Foundation

@MainActor

class MainViewModel: ObservableObject {
    @Published var planetData: JPLDataModel = JPLDataModel()
    @Published var numberToDisplay: String = ""
    
    func getDataFromAPI() {
        Task{
            print("todays date: " + todayDate)
            print("tomorrows date: " + TomorrowDate)
            planetData = try await JupiterCall().apiCall(startDate: todayDate, endDate: TomorrowDate)
            NumberFinder(number: planetData.result)
        }
    }
    
    func NumberFinder(number: String) {
        if let rangeOfDistance = planetData.result.range(of: "RG"){
            let rangeFixed = rangeOfDistance.upperBound
            let distanceToDisplay = planetData.result[rangeFixed...]
            let lower = distanceToDisplay.range(of: "RG= ")
            let lowerIndex = (lower?.upperBound)!
            let secondFixString = distanceToDisplay[lowerIndex...]
            let thirdFix = secondFixString.range(of: "E+08")
            let thirdFixIndex = (thirdFix?.lowerBound)!
            let thirdFixedString = secondFixString[..<thirdFixIndex]
            let numberToConvert = String(thirdFixedString)
            distanceConverter(stringToConver: numberToConvert)
        } else {
            print("NO NUMBER")
        }
    }
    
    func distanceConverter(stringToConver: String) {
        let dedotted = stringToConver.replacingOccurrences(of: ".", with: "")
        var distanceToSaturnInKm = dedotted.prefix(9)
        distanceToSaturnInKm.insert(",", at: distanceToSaturnInKm.index(distanceToSaturnInKm.startIndex, offsetBy: 3))
        distanceToSaturnInKm.insert(",", at: distanceToSaturnInKm.index(distanceToSaturnInKm.startIndex, offsetBy: 7))
        numberToDisplay = String(distanceToSaturnInKm)
//        print(dedotted)
    }
    
    var todayDate: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyy-MM-dd"
        let dateString = dateFormater.string(from: Date())
//        print(dateString)
        return dateString
    }
    
    var TomorrowDate: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyy-MM-dd"
        let todayDate = Date()
        let tomorrowDate = Calendar.current.date(byAdding: .day, value: 1, to: todayDate)!
        let dateString = dateFormater.string(from: tomorrowDate)
//        print(dateString)
        return dateString
    }
}
