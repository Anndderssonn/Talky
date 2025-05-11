//
//  StringExtension.swift
//  Talky
//
//  Created by Andersson on 10/05/25.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
