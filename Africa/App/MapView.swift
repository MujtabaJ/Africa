//
//  MapView.swift
//  Africa
//
//  Created by a on 11/21/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: BODY
    var body: some View {
        // MARK: NO1 BASIC MAP
//        Map(coordinateRegion: $region)
        
        // MARK: NO2 ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            // (A) PIN: OLD STYLE (always static)
//            MapPin(coordinate: item.locations, tint: .accentColor)
            
            // (B) MARKER: NEW STYLE (always static)
//            MapMarker(coordinate: item.locations, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION: (it could be interactive)
//            MapAnnotation(coordinate: item.locations) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            } //: MAP Annotation
            // (D) CUSTOM ADVANCED ANNOTATIONS (it could be interactive)
            
            MapAnnotation(coordinate: item.locations) {
                    MapAnnotationView(location: item)
            }
        }) //: MAP
            .overlay(
                HStack(alignment: .center, spacing: 12) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Text("Latitude:")
                                .foregroundColor(.accentColor)
                                .font(.footnote)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        } //: HStack
                        Divider()
                        HStack {
                            Text("Longitude:")
                                .foregroundColor(.accentColor)
                                .font(.footnote)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        } //: HStack

                    }
                } //: HSTACK
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(
                        Color.black
                            .cornerRadius(8)
                            .opacity(0.6)
                    )
                    .padding()
                , alignment: .top
            )
    }
}

// MARK: PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewDevice("iPhone 11 Pro")
    }
}
