//
//  InsertGalleryImageView.swift
//  Africa
//
//  Created by a on 11/21/21.
//

import SwiftUI

struct InsertGalleryImageView: View {
    // MARK: PROPERTIES
    var animal: Animal
    
    // MARK: BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                } //: LOOP
            } //: HSTACK
        } //: SCROLL
        
    }
}

// MARK: PREVIEW
struct InsertGalleryImageView_Previews: PreviewProvider {
    
    static var animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsertGalleryImageView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
