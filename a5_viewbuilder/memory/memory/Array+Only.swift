//
//  Array+Only.swift
//  memory
//
//  Created by Yang Yu on 2021/5/26.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
