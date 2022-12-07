//
//  AnimalDetailView.swift
//  Africa
//
//  Created by a on 11/21/21.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: PROPERTIES
    var animal: Animal
    
    // MARK: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20){
                //: IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                //: TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor.frame(height: 6).offset(y: 24))
                
                //: HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                //: GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsertGalleryImageView(animal: animal)
                    
                } //: GROUP
                .padding(.horizontal)
                
                //: FACTS
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Do you know?")
                    
                    InsetFactView(animal: animal)
                } //: GROUP
                
                //: DESCRIPTION
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                //: MAP
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                } //: GROUP
                .padding(.horizontal)
                
                //: LINK
                Group {
                    HeadingView(headingImage: "book.circle", headingText: "Learn more")
                    
                    ExternalWebLinkView(animal: animal)
                } //: GROUP
                .padding(.horizontal)
            } //: VSTACK
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        } //: SCROLL
    }
}

// MARK: PREVIEW
struct AnimalDetailView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 11 Pro")
    }
}
