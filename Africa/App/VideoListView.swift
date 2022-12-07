//
//  VideoListView.swift
//  Africa
//
//  Created by a on 11/21/21.
//

import SwiftUI

struct VideoListView: View {
    // MARK: PROPERTIES
    @State var video: [Videos] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(video) {item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoName: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }
            } //: LIST
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                    //shuffle videos
                        video.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        } //: NAVIGATION
    }
}

// MARK: PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
