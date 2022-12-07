//
//  VideoListItemView.swift
//  Africa
//
//  Created by a on 11/21/21.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: PROPERTIES
    var video: Videos
    
    // MARK: BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZSTACK
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .foregroundColor(.accentColor)
                    .font(.title2)
                    .fontWeight(.heavy)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VSTACK
        } //: HSTACK
    }
}

// MARK: PREVIEW
struct VideoListItemView_Previews: PreviewProvider {
    static var videos: [Videos] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
