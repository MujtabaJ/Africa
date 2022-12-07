//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by a on 11/21/21.
//

import SwiftUI

struct ExternalWebLinkView: View {
    // MARK: PROPERTIES
    var animal: Animal
    
    // MARK: BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.accentColor)
                    
                } //: GROUP
            } //: HSTACK
        } //: GROUPBOX
    }
}

// MARK: PREVIEW
struct ExternalWebLinkView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
