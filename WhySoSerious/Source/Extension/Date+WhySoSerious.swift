//
//  Date+WhySoSerious.swift
//  WhySoSerious
//
//  Created by Minseob Yoon on 2018. 1. 18..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import Foundation

extension Date {

    var nonSeperateFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: self)
    }
}
