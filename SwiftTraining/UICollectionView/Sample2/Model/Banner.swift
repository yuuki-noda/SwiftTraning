//
//  Banner.swift
//  SwiftTraining
//
//  Created by yuki noda on 2025/01/03.
//

import Foundation

struct Banner: Hashable, Sendable {
    let identifier: UUID = UUID()
    let imageURL: URL?
}
