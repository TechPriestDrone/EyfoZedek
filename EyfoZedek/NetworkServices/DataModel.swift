//
//  DataModel.swift
//  EyfoZedek
//
//  Created by Andrey Safronov on 05/02/2024.
//

import Foundation

struct JPLDataModel: Codable {
    var signature : Signature = Signature()
    var result : String = ""
  }

struct Signature: Codable {
    var source : String = ""
    var version : String = ""
  }
