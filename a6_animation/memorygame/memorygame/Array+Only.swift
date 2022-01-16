//
//  Array+Only.swift
//  memorygame
//
//  Created by Yang Yu on 2021/6/13.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
