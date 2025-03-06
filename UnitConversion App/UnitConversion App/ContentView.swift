//
//  ContentView.swift
//  UnitConversion App
//
//  Created by Aksh Garg on 05/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit: String = "Meters"
    @State private var outputUnit: String = "Kilometers"
    @State private var inputValue: String = ""
    @FocusState private var valueIsFocus: Bool
    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    var convertedValue: Double {
        let value = Double(inputValue) ?? 0
        let metersValue = convertToMeters(_value: value, from: inputUnit)
        return convertFromMeters(_value: metersValue, to: outputUnit)
    }
    
    func convertToMeters(_value: Double, from unit: String) -> Double {
        switch unit {
        case "Meters": return _value
        case "Kilometers": return _value * 1000
        case "Feet": return _value / 3.281
        case "Yards": return _value / 1.094
        case "Miles": return _value * 1609.34
        default: return _value
        }
    }
    
    func convertFromMeters(_value: Double, to unit: String) -> Double {
        switch unit {
        case "Meters": return _value
        case "Kilometers": return _value * 1000
        case "Feet": return _value / 3.281
        case "Yards": return _value / 1.094
        case "Miles": return _value * 1609.34
        default: return _value
        }
    }
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Input Value") {
                    TextField("Enter value", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocus)
                    
                    Picker("From", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output") {
                    Picker("To", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("Converted value: \(convertedValue, specifier: "%.2f")")
                }
                .navigationTitle("Unit Conversion")
                .toolbar {
                    if valueIsFocus {
                        Button("Done") {
                            valueIsFocus = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
