//
//  APICall.swift
//  EyfoZedek
//
//  Created by Andrey Safronov on 05/02/2024.
//

import Foundation


class JupiterCall {
    
    enum DataFetchError: Error {
        case runtimeError(String)
    }
    
    func apiCall(startDate: String, endDate: String) async throws -> JPLDataModel {
        
        let baseUrl = "https://ssd.jpl.nasa.gov/api/horizons.api?format=json&COMMAND='599'&OBJ_DATA='YES'&MAKE_EPHEM='YES'&EPHEM_TYPE='VECTOR'&CENTER='500@399'&START_TIME='\(startDate)'&STOP_TIME='\(endDate)'&STEP_SIZE='1%20d'&QUANTITIES='1,9,20,23,24,29'"
        
        guard let url = URL(string: baseUrl) else {
            throw DataFetchError.runtimeError("BAD URL")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(from: url)
        let returnedJupiterData: JPLDataModel = try JSONDecoder().decode(JPLDataModel.self, from: data)
//        print(returnedJupiterData)
        return returnedJupiterData
    }
}
