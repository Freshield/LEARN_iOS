//
//  Array+Identifiable.swift
//  memorygame
//
//  Created by Yang Yu on 2021/6/13.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
