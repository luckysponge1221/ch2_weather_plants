//
//  SecondScreen.swift
//  ch2_weather_plants
//
//  Created by Mutia Rahman  on 20/04/26.
//

import SwiftUI

struct SecondScreen: View {
    
    @State var selectedDate = Date()
    @State var isVisible = false
    @State private var selectedPlant: SeasonalItem?
    
    var filteredItems: [SeasonalItem] { // computed property
        let components = Calendar.current.dateComponents([.month], from: selectedDate)
        guard let month = components.month else { return [] }
        return items.filter{ $0.harvestMonthsMain.contains(month) || $0.harvestMonthsSec.contains(month) }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.bgshapeblurry)
                .frame(width: 400, height: 550)
                .position(x: 100, y: 10)
                .blur(radius: 50)
            
            Circle()
                .fill(Color.bgshapeblurry)
                .frame(width: 500, height: 300)
                .position(x: 300, y: 760)
                .blur(radius: 50)
            
            VStack {
                // Calendar
                DatePicker(
                    "Select Month",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .tint(Color.graccentcolor)

                
                //Spacer()
                
                // Filtered Plant list
                GeometryReader { geo in
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Plants of the Month")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                            Spacer()
                        }
                        .padding(.vertical)
                        
                        ScrollView(.vertical) {
                            ForEach(filteredItems, id: \.name) { item in
                                HStack (alignment: .center) {
                                    ZStack {
                                        Circle()
                                            .frame(height: 60)
                                            .foregroundStyle(Color.bgshapeblurry)
                                        Image(item.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                    }
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.white)
                                        Text(item.description)
                                            .font(.callout)
                                            .foregroundStyle(Color.white)
                                            .lineLimit(1)
                                    }
                                }
                                .onTapGesture {
                                    selectedPlant = item
                                    isVisible = true
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(height: geo.size.height)
                    .background(Color.gr2)
                    .cornerRadius(30)
                    .sheet(isPresented: $isVisible) {
                        if let plant = selectedPlant {
                            PlantDetailsView(isShowDetail: $isVisible, plant: plant)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    SecondScreen()
}
