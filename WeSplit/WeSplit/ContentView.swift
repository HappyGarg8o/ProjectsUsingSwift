//
//  ContentView.swift
//  WeSplit
//
//  Created by Aksh Garg on 02/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount: Double = 0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 10
    @FocusState private var amountIsFocus: Bool
    let tipPencentages = [10, 15, 0, 20, 25]
    var amountPerPerson:  Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
    
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var grandTotal: Double {
        let grandTotal = amount + (amount / 100 * Double(tipPercentage))
        return grandTotal
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("what is the amount?") {
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "Rs"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocus)
                }
                Section("How many people are splitting the bill?") {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPencentages, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Grand Total (including tip)") {
                    Text(grandTotal, format: .currency(code:
                        Locale.current.currency?.identifier ?? "Rs"))
                }
                Section("Amount to be paid by per person") {
                    Text(amountPerPerson, format: .currency(code:
                        Locale.current.currency?.identifier ?? "Rs"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocus {
                    Button("Done") {
                        amountIsFocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
