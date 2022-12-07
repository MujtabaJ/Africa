//
//  InsetFactView.swift
//  Africa
//
//  Created by a on 11/21/21.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: PROPERTIES
    var animal: Animal
    
    // MARK: BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                        .multilineTextAlignment(.leading)
                        .padding()
                } //: LOOP
            } //: TAB
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }

    }
}

// MARK: PREVIEW
struct InsetFactView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
