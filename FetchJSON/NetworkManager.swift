//
//  NetworkManager.swift
//  FetchJSON
//
//  Created by Matheus Pacheco Fusco on 19/06/19.
//  Copyright © 2019 Matheus Pacheco Fusco. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkManager: BindableObject {
    var didChange = PassthroughSubject<NetworkManager, Never>()
    var courses = [Course]() {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.courses = courses
                }
            } catch {
                print("Erro")
            }
        }.resume()
    }
}
