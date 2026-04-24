//
//  DataArray.swift
//  ch2_weather_plants
//
//  Created by Mutia Rahman  on 22/04/26.
//

import Foundation

struct SeasonalItem {
    let name: String
    let description: String
    let sunNeeds: String
    let waterNeeds: String
    let difficulty: String
    let harvestMonthsMain: [Int] // 1 = Jan, 12 = Dec
    let harvestMonthsSec: [Int]
    let image: String
}

var items = [
    SeasonalItem(
        name: "Spinach",
        description: "A fast-growing leafy green that thrives in the humid Indonesian climate. Very easy for beginners.",
        sunNeeds: "Full Sun",
        waterNeeds: "High (Keep soil moist)",
        difficulty: "Easy",
        harvestMonthsMain: [1, 2, 3, 11, 12],
        harvestMonthsSec: [4, 10],
        image: "waterspinach"
    ),
    
    SeasonalItem(
        name: "Bird's Eye Chili",
        description: "A staple in every Indonesian kitchen. Loves the heat and needs well-draining soil.",
        sunNeeds: "Full Sun",
        waterNeeds: "Moderate",
        difficulty: "Medium",
        harvestMonthsMain: [5, 6, 7, 8, 9],
        harvestMonthsSec: [4, 10],
        image: "birdseyechili"
    ),
    
    SeasonalItem(
        name: "Mango",
        description: "The pride of tropical fruit. Requires patience but highly rewarding. Needs a distinct dry season to fruit well.",
        sunNeeds: "Full Sun",
        waterNeeds: "Low (Drought tolerant once established)",
        difficulty: "Hard",
        harvestMonthsMain: [9, 10, 11],
        harvestMonthsSec: [12],
        image: "mango"
    ),
    
    SeasonalItem(
        name: "Butterfly Pea Flower",
        description: "An edible flower often used for tea. Very hardy and acts as a beautiful natural climber.",
        sunNeeds: "Full Sun / Partial Shade",
        waterNeeds: "Moderate",
        difficulty: "Easy",
        harvestMonthsMain: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        harvestMonthsSec: [],
        image: "butterflypeaflower"
    ),
    
    SeasonalItem(
        name: "Tomato",
        description: "Prefers the slightly cooler weather found during the rainy season transitions.",
        sunNeeds: "Full Sun",
        waterNeeds: "Moderate (Avoid wetting leaves)",
        difficulty: "Medium",
        harvestMonthsMain: [1, 2, 11, 12],
        harvestMonthsSec: [3, 10],
        image: "tomato"
    )
]
