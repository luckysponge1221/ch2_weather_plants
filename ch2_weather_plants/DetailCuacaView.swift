//
//  DetailCuacaView.swift
//  WeatherRemixApp
//
//  Created by Khaerul Alfian on 21/04/26.
//

import SwiftUI

struct DetailCuacaView: View {
    
//    @Binding var isShowDetailCuaca: Bool
    
    var body: some View {
        
        
        
        
        
        
        
        ZStack {
            
            Rectangle()
                    .fill(LinearGradient(colors: [.gr1, .gr2], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .frame(height: 610)
                    .cornerRadius(50)
                    .overlay {
                        Circle()
                            .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .top, endPoint: .bottomTrailing))
                            .frame(width: 600, height: 600)
                            .offset(x: 0, y: 300)
                            .opacity(0.3)
                        
                        Circle()
                            .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .top, endPoint: .bottomTrailing))
                            .frame(width: 400, height: 400)
                            .offset(x: 0, y: 300)
                            .opacity(0.3)
                        
                        Circle()
                            .fill(LinearGradient(colors: [.gr2, .gr1], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: 200, height: 200)
                            .offset(x: 0, y: 300)
                            .opacity(0.5)
                    } .clipShape(RoundedRectangle(cornerRadius: 50))
                
                VStack {
                    Text("Kabupaten Badung")
                        .foregroundStyle(Color(.white))
                        .font(.title)
                        .bold()
                    
                    Text("Today, 21 April 2026")
                        .foregroundStyle(Color(.white))
                        .font(.subheadline)
                    
                    
                    Image("heavyRain")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(.top, 30)
                    
                    Text("\(Text("35"))ºc")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundStyle(Color.white)
                    
                    Text("Heavy Rain")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(Color.white)
                    
                    ZStack {
                        Rectangle()
                            .cornerRadius(35)
                            .frame(height: 100)
                            .opacity(0.4)
                            .padding(20)
                            
                        HStack {
                            VStack {
                                Image(systemName:"sun.max.fill")
                                    .symbolRenderingMode(.multicolor)
                                
                                
                                Text("24 km/h")
                                    .bold()
                                    .foregroundStyle(Color(.white))

                                
                                Text("Wind")
                                    .font(.caption)
                                    .foregroundStyle(Color(.white))
                            }
                            Spacer()
                            
                            Divider()
                                .frame( width: 1, height: 60)
                                .background(Color.white)
                            
                            Spacer()
                            
                            VStack {
                                Image(systemName:"sun.max.fill")
                                    .symbolRenderingMode(.multicolor)
                                
                                
                                Text("24 km/h")
                                    .bold()
                                    .foregroundStyle(Color(.white))

                                
                                Text("Humidity")
                                    .font(.caption)
                                    .foregroundStyle(Color(.white))
                                
                            }
                            
                            Spacer()
                            
                            Divider()
                                .frame( width: 1, height: 60)
                                .background(Color.white)
                            
                            Spacer()
                            
                            VStack {
                                Image(systemName:"sun.max.fill")
                                    .symbolRenderingMode(.multicolor)
                                
                                
                                Text("24 km/h")
                                    .bold()
                                    .foregroundStyle(Color(.white))

                                
                                Text("Precipitation")
                                    .font(.caption)
                                    .foregroundStyle(Color(.white))
                                
                            }
                            
                        }
                        .padding(.horizontal, 50)
                    }
                        
                }
                .offset(y: 50)
                
            }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)


//                        .glassEffect()
            
        
    
    }
}


#Preview {
    DetailCuacaView()
}
