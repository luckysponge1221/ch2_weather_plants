//
//  ContentView.swift
//  WeatherRemixApp
//
//  Created by Khaerul Alfian on 17/04/26.
//

import SwiftUI

struct HourlyForecast: Identifiable {
    let id = UUID()
    var time: String
    var icon: String
    var temperature: Int
}

func getHourlyForecast() -> [HourlyForecast] {
    let startHour = Calendar.current.component(.hour, from: Date())
    let weatherIcons = ["cloud.fill", "cloud.sun.fill", "cloud.rain.fill", "cloud.snow.fill", "cloud.bolt.fill"]
    
    var displayHours: [HourlyForecast] = []
    
    displayHours.append(HourlyForecast(time: "Now", icon: weatherIcons.randomElement()!, temperature: Int.random(in: 25...36)))
    
    for i in 1..<24 {
        let targetHour = (startHour + i) % 24
        let timeString = String(format: "%02d", targetHour)
        
        // Creating new object for each hour
        let newForecast = HourlyForecast(
            time: timeString,
            icon: weatherIcons.randomElement()!,
            temperature: Int.random(in: 25...36)
        )
        displayHours.append(newForecast)
    }
    return displayHours
}

struct FirstScreen: View {
    
    @State var isShowDetail: Bool = false
    @State var isShowDetailCuaca: Bool = false
    @State var isVisible = false
    @State private var selectedPlant: SeasonalItem?
    @State private var hourlyForecasts: [HourlyForecast] = []
    
    var filteredItems: [SeasonalItem] { // computed property
        let currentMonth = Calendar.current.component(.month, from: Date())
        
        return items.filter{ $0.harvestMonthsMain.contains(currentMonth) || $0.harvestMonthsSec.contains(currentMonth) }
    }
    
    var body: some View {
        ZStack {
            //BACKGROUND STYLE
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
            
            // SCREEN COMPONENTS
            VStack {
                
                // MY LOCATION
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 50, height: 50)
                            .glassEffect()
                        
                        
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 25, design: .rounded))
                            .foregroundColor(Color.graccentcolor)
                        
                            
                    }
                    
                    VStack(alignment: .leading) {
                        Text("My Location")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(Color.gray)
                        
                        HStack {
                            Text("Kabupaten Badung")
                                .font(.title3)
                                .bold()
                            Image(systemName: "chevron.down")
                                .bold()
                        }
                    }
                    .padding(5)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 50, height: 50)
                            .glassEffect()
                        
                        Image(systemName: "bell")
                            .font(.system(size: 25, design: .rounded))
                            .foregroundStyle(Color.graccentcolor)
                    }
                }
                .padding(.horizontal, 20)
                
                // TODAYS WEATHER
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 150)
                        .cornerRadius(20)
                        .overlay {
                            
                            Circle()
                                .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 360, height: 360)
                                .offset(x: 150, y: 10)
                            
                            Circle()
                                .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .bottomLeading, endPoint: .topTrailing))
                                .frame(width: 280, height: 280)
                                .offset(x: 150, y: 30)
                            
                            Circle()
                                .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 200, height: 200)
                                .offset(x: 150, y: 30)
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal, 20)
                
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(Text("35"))ºc")
                                .font(.system(size: 50))
                                .bold()
                                .foregroundStyle(Color.white)
                            
                            Text("Heavy Rain")
                                .font(.title3)
                                .bold()
                                .foregroundStyle(Color.white)
                        }
                        
                        Spacer()
                        
                        Image("heavyRain")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140)
                        
                    }
                    .padding(.horizontal, 40)
                    .onTapGesture {
                        isShowDetailCuaca = true
                    }
                    .sheet(isPresented: $isShowDetailCuaca) {
                        DetailCuacaView()
                    }
                }
                
                Spacer()
                // TITLE
                Text("What \(Text("Plants").bold()) Will You Plant \(Text("This Week?").bold())")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                Spacer()
                // CARD
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(filteredItems, id:\.name) {i in
                            ZStack {
                                Rectangle()
                                    .fill(Color.bgshapeblurry)
                                    .frame(width: 230, height: 250)
                                    .cornerRadius(20)
                                
                                VStack {
                                    Image(i.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 180, height: 180)
                            
                                    ZStack {
                                        Rectangle()
                                            .fill(RadialGradient(colors: [.white, .bgshapeblurry], center: .center, startRadius: 20, endRadius: 200,))
                                            .frame(width: 200, height: 40)
                                            .cornerRadius(20)
                                            .padding(.horizontal, 10)
                                        
                                        Text(i.name)
                                            .font(.title3)
                                            .bold()
                                    }
                                }
                                .frame(width: 230, height: 260)
                                .padding(0)
                            }
                            .onTapGesture {
                                selectedPlant = i
                                isVisible = true
                            }
                        }
                    }
                    .sheet(isPresented: $isVisible) {
                        if let plant = selectedPlant {
                            PlantDetailsView(isShowDetail: $isVisible, plant: plant)
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                // DAILY WEATHER
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(colors: [.gr1, .gr2], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 360, height: 130)
                        .cornerRadius(20)
                        .overlay {
                            
                            Circle()
                                .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 400, height: 400)
                                .offset(x: -200, y: 100)
                            
                            Circle()
                                .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .bottomLeading, endPoint: .topTrailing))
                                .frame(width: 300, height: 300)
                                .offset(x: -200, y: 100)
                            
                            Circle()
                                .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 200, height: 200)
                                .offset(x: -200, y: 100)
                            
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                    VStack {
                        ScrollView(.horizontal) {
                            HStack(spacing: 20){
                                ForEach(hourlyForecasts) { hour in
                                    VStack(alignment: .center, spacing: 5) {
                                        Text(hour.time)
                                        
                                        Spacer()
                                        
                                        Image(systemName: hour.icon)
                                            .symbolRenderingMode(.multicolor)
                                        
                                        Spacer()
                                        
                                        Text("\(hour.temperature)º")
                                    }
                                    .onTapGesture {
                                        isShowDetail = true
                                    }
                                }
                            }
                            .onAppear {
                                self.hourlyForecasts = getHourlyForecast()
                            }
                        }
                        .padding(20)
                    }
                    .frame(height: 130)
                    .cornerRadius(20)
                    .padding(20)
                    .sheet (isPresented: $isShowDetail) {
                        DetailView(isShowDetail: $isShowDetail)
                    }
                }
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    FirstScreen()
}
