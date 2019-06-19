//
//  CourseListView.swift
//  FetchJSON
//
//  Created by Matheus Pacheco Fusco on 19/06/19.
//  Copyright © 2019 Matheus Pacheco Fusco. All rights reserved.
//

import SwiftUI

struct CourseListView : View {
    @State var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.courses) {
                CourseRowView(course: $0)
            }
            .navigationBarTitle(Text("Cursos"))
        }
    }
}

#if DEBUG
struct CourseListView_Previews : PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
#endif
