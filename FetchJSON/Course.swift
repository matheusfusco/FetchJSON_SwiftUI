//
//  File.swift
//  FetchJSON
//
//  Created by Matheus Pacheco Fusco on 19/06/19.
//  Copyright © 2019 Matheus Pacheco Fusco. All rights reserved.
//

import Foundation
import SwiftUI

struct Course: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let link: String
}
