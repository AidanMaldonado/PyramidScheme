//
//  GasProvider.swift
//  PyramidScheme
//
//  Created by Aidan Maldonado on 3/23/19.
//  Copyright © 2019 Aidan Maldonado. All rights reserved.
//

struct GasProvider {
    
    func gasVariable(gas: Int) -> String {
        var display = ""
        switch gas {
        case 1:
            display = "+----"
        case 2:
            display = "++---"
        case 3:
            display = "+++--"
        case 4:
            display = "++++-"
        case 5:
            display = "+++++"
        default:
            display = "---"
        }
        return display
    }
}
