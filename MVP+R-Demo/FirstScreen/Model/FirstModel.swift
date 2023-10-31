//
//  FirstModel.swift
//  MVP+R-Demo
//
//  Created by Dmitry Gorbunow on 10/28/23.
//

import Foundation

protocol FirstModelProtocol {
    func getData() -> String
    func setData(data: String)
}

final class FirstModel {
    private var someData: String?
}

extension FirstModel: FirstModelProtocol {
    func getData() -> String {
        guard let someData = self.someData else { return "" }
        return someData
    }
    
    func setData(data: String) {
        self.someData = data
    }
}
