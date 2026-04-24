//
//  PlantDetailsView.swift
//  ch2_weather_plants
//
//  Created by Mutia Rahman  on 21/04/26.
//

import SwiftUI

struct PlantDetailsView: View {
    
    @Binding var isShowDetail: Bool
    let plant: SeasonalItem
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action : {
                isShowDetail = false
            }) {
                Image(systemName: "xmark")
                    .font(.system(size: 25))
                    .foregroundColor(Color.black)
                    .frame(width: 48, height: 48)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
            }
        }
        .padding()
        
        ZStack {
            Circle()
                .frame(width: 220, height: 220)
                .foregroundStyle(Color.bgshapeblurry.opacity(0.4))
                .padding(.horizontal)
                .padding(.bottom)
            
            Image(plant.image)
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
        }
        
        VStack {
            Text(plant.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom)
                .multilineTextAlignment(.center)
            
            Text(plant.description)
                .padding(.horizontal)
                
            
            Divider()
                .padding(.bottom)
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 140, height: 160)
                            .foregroundStyle(Color.bgshapeblurry)
                            .cornerRadius(20)
                        
                        VStack(spacing: 11) {
                            
                            Text("Water")
                                .font(.system(size: 18))
                                .foregroundStyle(Color.darkgreen)
                                
                            
                            Image(systemName: "drop.fill")
                                .font(.system(size:28))
                                .foregroundStyle(Color.darkgreen)

                            Text(plant.waterNeeds)
                                .frame(width: 100)
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.darkgreen.opacity(0.7))

                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 140, height: 160)
                            .foregroundStyle(Color.bgshapeblurry)
                            .cornerRadius(20)
                        
                        VStack(spacing: 11) {
                            
                            Text("Sun")
                                .font(.system(size: 18))
                                .foregroundStyle(Color.darkgreen)
                                
                            
                            Image(systemName: "sun.max.fill")
                                .font(.system(size:28))
                                .foregroundStyle(Color.darkgreen)

                            Text(plant.sunNeeds)
                                .frame(width: 100)
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.darkgreen.opacity(0.7))

                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 140, height: 160)
                            .foregroundStyle(Color.bgshapeblurry)
                            .cornerRadius(20)
                        
                        VStack(spacing: 11) {
                            
                            Text("Difficulty")
                                .font(.system(size: 18))
                                .foregroundStyle(Color.darkgreen)
                                
                            
                            Image(systemName: "chart.bar")
                                .font(.system(size:28))
                                .foregroundStyle(Color.darkgreen)

                            Text(plant.difficulty)
                                .frame(width: 100)
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.darkgreen.opacity(0.7))

                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            Button (action: {
                
            }) {
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.darkgreen)
                        .frame(width: 120, height: 50)
                        .cornerRadius(30)
                    
                    Text("Plant")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 23, weight: .bold))
                }
                .padding()
            }
        }
        
        Spacer()
        
    }
}

#Preview {
    let samplePlant = items[0]
    
    PlantDetailsView(
        isShowDetail: .constant(true), plant: samplePlant
    )
}
