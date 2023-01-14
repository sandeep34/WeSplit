//
//  ContentView.swift
//  WeSplit
//
//  Created by Sandeep.Tomar on 08/12/22.
//

import SwiftUI
import CoreData

/*struct ContentView: View {
let students = ["sandeep", "tomar", "dev"]
    @State private var selectedStudent = ""
    var body: some View {
        NavigationView {
            Form {
                Picker("Select Your Student", selection: $selectedStudent ) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}
*/

struct ContentView: View {
    
    @State private var checkAmout = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10,15,20,25,0]
    @FocusState var amountFocused: Bool
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmout / 100 * tipSelection
        let grandTotal = checkAmout + tipValue
        return grandTotal
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmout, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                    .keyboardType(.decimalPad)
                    .focused($amountFocused)
                
                Picker("Number of People", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) People")
                    }
                }
            }
            
            Section {
                
                Picker("Select Percentage", selection:  $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented)
            } header: {
                Text("How much tip do you want to leave")
            }
            
            Section {
                Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
            }
        }
        .navigationTitle("Sandeep Tomar")
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    amountFocused = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
