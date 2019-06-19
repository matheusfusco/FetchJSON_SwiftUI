//
//  CourseRowView.swift
//  FetchJSON
//
//  Created by Matheus Pacheco Fusco on 19/06/19.
//  Copyright © 2019 Matheus Pacheco Fusco. All rights reserved.
//

import SwiftUI
import Combine

struct CourseRowView : View {
    let course: Course
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageViewWidget(imageUrl: course.imageUrl)
            Text(course.name)
        }
    }
}

class ImageLoader: BindableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}

struct ImageViewWidget: View {
    @ObjectBinding var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body: some View {
        Image(uiImage: (imageLoader.data.count == 0) ? UIImage(named: "swift")! : UIImage(data: imageLoader.data)!)
            .resizable()
            .frame(width: nil, height: 180, alignment: .center)
    }
}

#if DEBUG
struct CourseRowView_Previews : PreviewProvider {
    static var previews: some View {
        CourseRowView(course: Course(id: 0, name: "Exemplo", imageUrl: "sem imagem", link: "sem link"))
    }
}
#endif
