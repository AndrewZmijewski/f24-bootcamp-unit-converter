//
//  ContentView.swift
//  Unit-Converter
//
//  Created by Andrew Zmijewski on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var unit = "mL"
    @State var unitOut = "mL"
    @State var input = 0.0
    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41
    
    var toMilliliter: Double {
        switch unit {
        case "mL" :
            return input
        case "Liters" :
            return input*literToMilliliter
        case "Cups" :
            return input*cupToMilliliter
        case "Pints" :
            return input*pintToMilliliter
        default :
            return input*gallonToMilliliter
        }
    }
    
    var toUnit: Double {
        switch unitOut {
        case "mL" :
            return toMilliliter
        case "Liters" :
            return toMilliliter/literToMilliliter
        case "Cups" :
            return toMilliliter/cupToMilliliter
        case "Pints" :
            return toMilliliter/pintToMilliliter
        default :
            return toMilliliter/gallonToMilliliter
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input value and unit") {
                    TextField("Input Value", value:$input, format: .number)
                    Picker("Input Unit", selection: $unit) {
                        ForEach(units, id: \.self) {
                            u in Text(u)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Convert to") {
                    Picker("Output Unit", selection: $unitOut) {
                        ForEach(units, id: \.self) {
                            u in Text(u)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output") {
                    Text("\(toUnit, specifier: "%.2f")")
                }
            }
            .navigationTitle("Volume Converter")
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
