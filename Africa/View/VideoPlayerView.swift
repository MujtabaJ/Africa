//
//  VideoPlayerView.swift
//  Africa
//
//  Created by a on 11/21/21.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: PROPERTIES
    var videoSelected: String
    var videoName: String
    
    // MARK: BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
//                Text(videoName)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.horizontal, 8)
                    .padding(.top, 6)
                , alignment: .topLeading
            )
        } //: VSTACK
        .accentColor(.accentColor)
        .navigationTitle(videoName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoName: "Lion")
        }
    }
}
