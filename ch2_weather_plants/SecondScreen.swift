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
                ZStack {
                    
//                    Rectangle()
//                        .fill(RadialGradient(colors: [.white, .bgshapeblurry], center: .center, startRadius: 20, endRadius: 400,))
//                        .frame(width: 380, height: 370)
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                        .padding(.horizontal, 10)
                       
                    
                    DatePicker(
                        "Select Month",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .tint(Color.graccentcolor)
                    .cornerRadius(20)
                    .padding(.horizontal, 40)
                }


                
                Spacer()
                // Filtered Plant list
                ZStack {
                    
                    Rectangle()
                        .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .bottomLeading, endPoint: .topTrailing))
//                        .frame(height: 650)
                        .cornerRadius(20)
                        .overlay {
                            Circle()
                                .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .top, endPoint: .bottomTrailing))
                                .frame(width: 600, height: 600)
                                .offset(x: 0, y: 200)
                                .opacity(0.3)
                            
                            Circle()
                                .fill(LinearGradient(colors: [.gr1, .gr2], startPoint: .top, endPoint: .bottomTrailing))
                                .frame(width: 400, height: 400)
                                .offset(x: 0, y: 200)
                                .opacity(0.3)
                            
                            Circle()
                                .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 200, height: 200)
                                .offset(x: 0, y: 200)
                                .opacity(0.5)
                        } .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal, 20)
                        
                    
                    GeometryReader { geo in
                        VStack() {
                            HStack {
                                ZStack {
                                    
                                    
                                    Rectangle()
                                        .fill(RadialGradient(colors: [.white, .bgshapeblurry], center: .center, startRadius: 20, endRadius: 200,))
                                        .frame(width: 250, height: 40)
                                        .cornerRadius(20)
                                        .padding(.horizontal, 10)
                                    
                                    
                                    
                                    Text("Plants Of The Month")
                                            .font(.title3)
                                            .bold()
                                            
                                    
                                    
                                        
                                }
                                
                            }
//                            .padding(.vertical)
                            
                            ScrollView(.vertical) {
                                
                                    VStack(alignment: .leading) {
                                        ForEach(filteredItems, id: \.name) { item in
                                        HStack () {
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
                                                    .font(.headline)
                                                    .foregroundStyle(Color.white)
                                                Text(item.description)
                                                    .font(.caption)
                                                    .foregroundStyle(Color.white)
                                                    .lineLimit(1)
                                                
                                                Divider()
                                                    .background(Color.white)
                                            }
                                        }
                                        
                                        .onTapGesture {
                                            selectedPlant = item
                                            isVisible = true
                                        }
                                    }
                                }
                            } .padding(20)
                        }
                        .padding()
                        //                    .frame(height: geo.size.height)
                        //                    .background(Color.gr2)
                        .cornerRadius(30)
                        .sheet(isPresented: $isVisible) {
                            if let plant = selectedPlant {
                                PlantDetailsView(isShowDetail: $isVisible, plant: plant)
                            }
                        }
                    }
                }
            }
        }
//        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    SecondScreen()
}
