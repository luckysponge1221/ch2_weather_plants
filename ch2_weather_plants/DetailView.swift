//
//  DetailView.swift
//  WeatherRemixApp
//
//  Created by Khaerul Alfian on 20/04/26.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var isShowDetail: Bool
    
    var body: some View {
        
        Text("Detail")
        Button("Close") {
            isShowDetail = false
        }
    }
}


